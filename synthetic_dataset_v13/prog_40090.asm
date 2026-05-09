; DESCRIPTION: Places a purple line segment connecting (240, 241) to (27, 83).
; PLAN: r0=240(x1), r1=241(y1), r2=27(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 241
LDI r2, 27
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
