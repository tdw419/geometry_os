; DESCRIPTION: Composite: Places a magenta circle of radius 29 at center (234, 206) then Places a black 94x63 rectangle at position (319, 159).
; PLAN: r0=234(x), r1=206(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x), r6=159(y), r7=94(width), r8=63(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 206
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 159
LDI r7, 94
LDI r8, 63
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
