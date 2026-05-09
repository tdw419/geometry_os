; DESCRIPTION: Composite: Places a black 101x94 rectangle at position (57, 126) then Renders a orange disk with center (442, 179) and radius 29.
; PLAN: r0=57(x), r1=126(y), r2=101(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=179(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 57
LDI r1, 126
LDI r2, 101
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 179
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
