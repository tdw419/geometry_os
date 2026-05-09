; DESCRIPTION: Renders a black line between points (241, 203) and (481, 58).
; PLAN: r0=241(x1), r1=203(y1), r2=481(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 203
LDI r2, 481
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
