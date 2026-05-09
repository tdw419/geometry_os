; DESCRIPTION: Renders a red line between points (172, 130) and (460, 18).
; PLAN: r0=172(x1), r1=130(y1), r2=460(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 130
LDI r2, 460
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
