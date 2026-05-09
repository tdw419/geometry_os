; DESCRIPTION: Composite: Renders a cyan line between points (96, 183) and (355, 172) then Places a green circle of radius 16 at center (184, 36).
; PLAN: r0=96(x1), r1=183(y1), r2=355(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=36(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 96
LDI r1, 183
LDI r2, 355
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 36
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
