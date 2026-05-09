; DESCRIPTION: Composite: Draws a magenta rectangle at (168, 43) with width 82 and height 85 then Places a red circle of radius 58 at center (81, 138).
; PLAN: r0=168(x), r1=43(y), r2=82(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=138(y), r7=58(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 168
LDI r1, 43
LDI r2, 82
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 138
LDI r7, 58
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
