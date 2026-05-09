; DESCRIPTION: Composite: Creates a orange circular shape at (87, 109) with radius 73 then Renders a green line between points (20, 151) and (25, 137).
; PLAN: r0=87(x), r1=109(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x1), r6=151(y1), r7=25(x2), r8=137(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 109
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 151
LDI r7, 25
LDI r8, 137
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
