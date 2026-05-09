; DESCRIPTION: Renders a red line between points (233, 130) and (342, 172).
; PLAN: r0=233(x1), r1=130(y1), r2=342(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 130
LDI r2, 342
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
