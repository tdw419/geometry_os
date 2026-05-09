; DESCRIPTION: Composite: Sets a single orange pixel at (508, 44) then Renders a purple box of size 66x66 starting at (15, 87) then Creates a blue circular shape at (329, 168) with radius 32.
; PLAN: r0=508(x), r1=44(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=15(x), r6=87(y), r7=66(width), r8=66(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=329(x), r11=168(y), r12=32(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 508
LDI r1, 44
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 15
LDI r6, 87
LDI r7, 66
LDI r8, 66
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 168
LDI r12, 32
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
