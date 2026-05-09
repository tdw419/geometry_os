; DESCRIPTION: Draws a black line from (444, 130) to (340, 226).
; PLAN: r0=444(x1), r1=130(y1), r2=340(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 130
LDI r2, 340
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
