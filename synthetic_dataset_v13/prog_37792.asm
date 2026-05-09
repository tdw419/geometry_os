; DESCRIPTION: Composite: Draws a blue circle centered at (342, 193) with radius 53 then Places a green 24x54 rectangle at position (415, 198).
; PLAN: r0=342(x), r1=193(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x), r6=198(y), r7=24(width), r8=54(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 193
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 198
LDI r7, 24
LDI r8, 54
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
