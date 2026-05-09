; DESCRIPTION: Composite: Sets a single white pixel at (326, 157) then Places a black 42x10 rectangle at position (20, 79) then Creates a cyan circular shape at (120, 147) with radius 63.
; PLAN: r0=326(x), r1=157(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=20(x), r6=79(y), r7=42(width), r8=10(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=120(x), r11=147(y), r12=63(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 326
LDI r1, 157
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 20
LDI r6, 79
LDI r7, 42
LDI r8, 10
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 147
LDI r12, 63
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
