; DESCRIPTION: Renders a red line between points (253, 52) and (460, 11).
; PLAN: r0=253(x1), r1=52(y1), r2=460(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 52
LDI r2, 460
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
