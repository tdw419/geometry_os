; DESCRIPTION: Renders a black line between points (338, 18) and (341, 83).
; PLAN: r0=338(x1), r1=18(y1), r2=341(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 18
LDI r2, 341
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
