; DESCRIPTION: Places a red line segment connecting (104, 142) to (207, 51).
; PLAN: r0=104(x1), r1=142(y1), r2=207(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 142
LDI r2, 207
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
