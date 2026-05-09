; DESCRIPTION: Places a purple line segment connecting (324, 55) to (209, 27).
; PLAN: r0=324(x1), r1=55(y1), r2=209(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 55
LDI r2, 209
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
