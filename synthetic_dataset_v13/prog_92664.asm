; DESCRIPTION: Places a black line segment connecting (426, 130) to (143, 160).
; PLAN: r0=426(x1), r1=130(y1), r2=143(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 130
LDI r2, 143
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
