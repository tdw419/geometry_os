; DESCRIPTION: Renders a black line between points (357, 17) and (127, 159).
; PLAN: r0=357(x1), r1=17(y1), r2=127(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 17
LDI r2, 127
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
