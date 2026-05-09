; DESCRIPTION: Composite: Sets a single red pixel at (109, 132) then Places a green 82x48 rectangle at position (310, 52) then Draws a cyan circle centered at (441, 86) with radius 35.
; PLAN: r0=109(x), r1=132(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=52(y), r7=82(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x), r11=86(y), r12=35(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 109
LDI r1, 132
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 310
LDI r6, 52
LDI r7, 82
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 86
LDI r12, 35
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
