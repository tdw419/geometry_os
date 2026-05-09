; DESCRIPTION: Composite: Places a magenta circle of radius 55 at center (379, 197) then Places a blue 69x97 rectangle at position (140, 106).
; PLAN: r0=379(x), r1=197(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=106(y), r7=69(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 197
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 106
LDI r7, 69
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
