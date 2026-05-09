; DESCRIPTION: Composite: Places a black 111x117 rectangle at position (231, 117) then Creates a green circular shape at (86, 177) with radius 63.
; PLAN: r0=231(x), r1=117(y), r2=111(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=177(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 231
LDI r1, 117
LDI r2, 111
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 177
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
