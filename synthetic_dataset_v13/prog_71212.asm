; DESCRIPTION: Places a purple line segment connecting (52, 241) to (81, 166).
; PLAN: r0=52(x1), r1=241(y1), r2=81(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 241
LDI r2, 81
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
