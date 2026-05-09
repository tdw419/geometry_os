; DESCRIPTION: Renders a black line between points (434, 17) and (211, 83).
; PLAN: r0=434(x1), r1=17(y1), r2=211(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 17
LDI r2, 211
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
