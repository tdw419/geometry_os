; DESCRIPTION: Renders a black line between points (140, 21) and (499, 191).
; PLAN: r0=140(x1), r1=21(y1), r2=499(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 21
LDI r2, 499
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
