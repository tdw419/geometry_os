; DESCRIPTION: Composite: Draws a blue circle centered at (368, 168) with radius 35 then Places a white 88x81 rectangle at position (178, 4).
; PLAN: r0=368(x), r1=168(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=4(y), r7=88(width), r8=81(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 168
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 4
LDI r7, 88
LDI r8, 81
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
