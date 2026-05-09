; DESCRIPTION: Composite: Places a white dot at position (150, 212) then Places a blue 99x72 rectangle at position (409, 84) then Draws a black circle centered at (106, 42) with radius 21.
; PLAN: r0=150(x), r1=212(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=84(y), r7=99(width), r8=72(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=106(x), r11=42(y), r12=21(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 150
LDI r1, 212
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 409
LDI r6, 84
LDI r7, 99
LDI r8, 72
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 42
LDI r12, 21
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
