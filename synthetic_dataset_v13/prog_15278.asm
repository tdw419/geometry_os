; DESCRIPTION: Composite: Places a purple circle of radius 20 at center (251, 63) then Draws a green rectangle at (323, 67) with width 80 and height 36 then Sets a single orange pixel at (69, 126).
; PLAN: r0=251(x), r1=63(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=67(y), r7=80(width), r8=36(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=69(x), r11=126(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 63
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 67
LDI r7, 80
LDI r8, 36
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 126
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
