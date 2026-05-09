; DESCRIPTION: Composite: Renders a purple disk with center (141, 210) and radius 38 then Draws a red rectangle at (217, 88) with width 42 and height 32.
; PLAN: r0=141(x), r1=210(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=88(y), r7=42(width), r8=32(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 210
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 88
LDI r7, 42
LDI r8, 32
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
