; DESCRIPTION: Composite: Renders a orange disk with center (360, 54) and radius 27 then Places a red 113x29 rectangle at position (47, 141).
; PLAN: r0=360(x), r1=54(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=141(y), r7=113(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 54
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 141
LDI r7, 113
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
