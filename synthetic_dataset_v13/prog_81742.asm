; DESCRIPTION: Renders a black line between points (347, 187) and (327, 203).
; PLAN: r0=347(x1), r1=187(y1), r2=327(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 187
LDI r2, 327
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
