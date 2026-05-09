; DESCRIPTION: Renders a green line between points (460, 43) and (348, 69).
; PLAN: r0=460(x1), r1=43(y1), r2=348(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 43
LDI r2, 348
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
