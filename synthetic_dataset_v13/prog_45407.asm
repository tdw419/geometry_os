; DESCRIPTION: Renders a black line between points (152, 159) and (151, 4).
; PLAN: r0=152(x1), r1=159(y1), r2=151(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 159
LDI r2, 151
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
