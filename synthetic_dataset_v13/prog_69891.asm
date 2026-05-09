; DESCRIPTION: Places a blue line segment connecting (219, 102) to (319, 27).
; PLAN: r0=219(x1), r1=102(y1), r2=319(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 102
LDI r2, 319
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
