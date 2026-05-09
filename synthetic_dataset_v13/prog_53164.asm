; DESCRIPTION: Renders a black line between points (457, 213) and (175, 163).
; PLAN: r0=457(x1), r1=213(y1), r2=175(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 213
LDI r2, 175
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
