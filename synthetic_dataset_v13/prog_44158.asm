; DESCRIPTION: Places a white line segment connecting (472, 164) to (319, 148).
; PLAN: r0=472(x1), r1=164(y1), r2=319(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 164
LDI r2, 319
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
