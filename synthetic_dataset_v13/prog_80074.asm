; DESCRIPTION: Places a black line segment connecting (264, 207) to (104, 60).
; PLAN: r0=264(x1), r1=207(y1), r2=104(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 207
LDI r2, 104
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
