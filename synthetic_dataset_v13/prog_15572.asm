; DESCRIPTION: Composite: Places a purple 86x94 rectangle at position (311, 152) then Draws a blue circle centered at (157, 126) with radius 52.
; PLAN: r0=311(x), r1=152(y), r2=86(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=126(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 311
LDI r1, 152
LDI r2, 86
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 126
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
