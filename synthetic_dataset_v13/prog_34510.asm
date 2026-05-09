; DESCRIPTION: Composite: Creates a red circular shape at (144, 123) with radius 63 then Draws a black rectangle at (208, 103) with width 115 and height 56.
; PLAN: r0=144(x), r1=123(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x), r6=103(y), r7=115(width), r8=56(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 123
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 103
LDI r7, 115
LDI r8, 56
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
