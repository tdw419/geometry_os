; DESCRIPTION: Composite: Places a white circle of radius 58 at center (220, 59) then Draws a purple rectangle at (309, 96) with width 43 and height 64.
; PLAN: r0=220(x), r1=59(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=96(y), r7=43(width), r8=64(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 59
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 96
LDI r7, 43
LDI r8, 64
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
