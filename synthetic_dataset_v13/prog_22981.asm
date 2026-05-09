; DESCRIPTION: Renders a black line between points (426, 1) and (352, 170).
; PLAN: r0=426(x1), r1=1(y1), r2=352(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 1
LDI r2, 352
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
