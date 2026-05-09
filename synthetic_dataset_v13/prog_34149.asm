; DESCRIPTION: Composite: Draws a white rectangle at (411, 121) with width 36 and height 115 then Renders a red disk with center (440, 151) and radius 58.
; PLAN: r0=411(x), r1=121(y), r2=36(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=151(y), r7=58(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 121
LDI r2, 36
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 151
LDI r7, 58
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
