; DESCRIPTION: Composite: Places a purple dot at position (25, 112) then Places a purple 21x63 rectangle at position (42, 114) then Draws a black circle centered at (94, 188) with radius 55.
; PLAN: r0=25(x), r1=112(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=114(y), r7=21(width), r8=63(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x), r11=188(y), r12=55(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 112
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 114
LDI r7, 21
LDI r8, 63
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 188
LDI r12, 55
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
