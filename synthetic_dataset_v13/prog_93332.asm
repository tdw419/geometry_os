; DESCRIPTION: Places a blue line segment connecting (372, 29) to (361, 187).
; PLAN: r0=372(x1), r1=29(y1), r2=361(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 29
LDI r2, 361
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
