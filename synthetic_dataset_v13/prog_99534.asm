; DESCRIPTION: Composite: Creates a purple circular shape at (192, 81) with radius 55 then Draws a red rectangle at (65, 93) with width 114 and height 115.
; PLAN: r0=192(x), r1=81(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x), r6=93(y), r7=114(width), r8=115(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 81
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 93
LDI r7, 114
LDI r8, 115
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
