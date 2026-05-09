; DESCRIPTION: Composite: Renders a purple box of size 86x12 starting at (411, 6) then Places a black circle of radius 63 at center (94, 87).
; PLAN: r0=411(x), r1=6(y), r2=86(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x), r6=87(y), r7=63(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 6
LDI r2, 86
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 87
LDI r7, 63
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
