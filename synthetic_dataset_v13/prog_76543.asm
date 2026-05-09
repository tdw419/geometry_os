; DESCRIPTION: Composite: Renders a orange line between points (20, 93) and (81, 38) then Creates a orange circular shape at (130, 113) with radius 55.
; PLAN: r0=20(x1), r1=93(y1), r2=81(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=113(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 20
LDI r1, 93
LDI r2, 81
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 113
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
