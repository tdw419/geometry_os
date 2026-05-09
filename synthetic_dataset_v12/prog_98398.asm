; DESCRIPTION: Renders a black line between points (363, 203) and (127, 98).
; PLAN: r0=363(x1), r1=203(y1), r2=127(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 203
LDI r2, 127
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
