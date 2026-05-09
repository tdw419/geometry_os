; DESCRIPTION: Composite: Renders a cyan line between points (257, 24) and (461, 173) then Draws a blue circle centered at (158, 106) with radius 77.
; PLAN: r0=257(x1), r1=24(y1), r2=461(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=106(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 257
LDI r1, 24
LDI r2, 461
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 106
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
