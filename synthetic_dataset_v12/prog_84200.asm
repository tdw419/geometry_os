; DESCRIPTION: Composite: Creates a green circular shape at (246, 121) with radius 27 then Renders a orange line between points (292, 80) and (96, 157).
; PLAN: r0=246(x), r1=121(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x1), r6=80(y1), r7=96(x2), r8=157(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 121
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 80
LDI r7, 96
LDI r8, 157
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
