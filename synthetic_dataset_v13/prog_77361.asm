; DESCRIPTION: Composite: Draws a green rectangle at (336, 95) with width 111 and height 106 then Places a white circle of radius 42 at center (200, 106).
; PLAN: r0=336(x), r1=95(y), r2=111(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x), r6=106(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 336
LDI r1, 95
LDI r2, 111
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 106
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
