; DESCRIPTION: Draws a black line from (319, 130) to (185, 138).
; PLAN: r0=319(x1), r1=130(y1), r2=185(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 130
LDI r2, 185
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
