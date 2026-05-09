; DESCRIPTION: Composite: Sets a single yellow pixel at (357, 53) then Places a blue 87x20 rectangle at position (350, 103) then Creates a cyan circular shape at (407, 90) with radius 74.
; PLAN: r0=357(x), r1=53(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=103(y), r7=87(width), r8=20(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=407(x), r11=90(y), r12=74(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 357
LDI r1, 53
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 350
LDI r6, 103
LDI r7, 87
LDI r8, 20
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 90
LDI r12, 74
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
