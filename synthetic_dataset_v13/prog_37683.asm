; DESCRIPTION: Renders a black line between points (17, 116) and (134, 246).
; PLAN: r0=17(x1), r1=116(y1), r2=134(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 116
LDI r2, 134
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
