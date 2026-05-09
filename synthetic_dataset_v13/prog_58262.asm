; DESCRIPTION: Renders a black line between points (352, 6) and (481, 17).
; PLAN: r0=352(x1), r1=6(y1), r2=481(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 6
LDI r2, 481
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
