; DESCRIPTION: Renders a black line between points (87, 55) and (261, 203).
; PLAN: r0=87(x1), r1=55(y1), r2=261(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 55
LDI r2, 261
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
