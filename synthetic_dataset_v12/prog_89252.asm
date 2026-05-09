; DESCRIPTION: Places a black line segment connecting (12, 3) to (319, 74).
; PLAN: r0=12(x1), r1=3(y1), r2=319(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 3
LDI r2, 319
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
