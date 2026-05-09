; DESCRIPTION: Places a green line segment connecting (14, 45) to (380, 104).
; PLAN: r0=14(x1), r1=45(y1), r2=380(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 45
LDI r2, 380
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
