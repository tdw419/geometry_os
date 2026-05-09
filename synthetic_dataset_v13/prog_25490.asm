; DESCRIPTION: Composite: Draws a purple circle centered at (240, 70) with radius 52 then Draws a red rectangle at (151, 93) with width 114 and height 10.
; PLAN: r0=240(x), r1=70(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=93(y), r7=114(width), r8=10(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 70
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 93
LDI r7, 114
LDI r8, 10
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
