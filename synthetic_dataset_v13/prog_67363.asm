; DESCRIPTION: Composite: Places a magenta circle of radius 60 at center (346, 81) then Draws a green rectangle at (379, 138) with width 64 and height 95.
; PLAN: r0=346(x), r1=81(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=138(y), r7=64(width), r8=95(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 81
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 138
LDI r7, 64
LDI r8, 95
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
