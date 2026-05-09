; DESCRIPTION: Composite: Sets a single cyan pixel at (312, 85) then Places a green 13x32 rectangle at position (126, 8) then Draws a green circle centered at (156, 152) with radius 53.
; PLAN: r0=312(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=8(y), r7=13(width), r8=32(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=152(y), r12=53(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 312
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 126
LDI r6, 8
LDI r7, 13
LDI r8, 32
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 152
LDI r12, 53
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
