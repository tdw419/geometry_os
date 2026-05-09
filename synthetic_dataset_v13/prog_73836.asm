; DESCRIPTION: Composite: Creates a green circular shape at (392, 30) with radius 20 then Draws a magenta rectangle at (70, 11) with width 90 and height 62 then Places a red dot at position (371, 74).
; PLAN: r0=392(x), r1=30(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=11(y), r7=90(width), r8=62(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=74(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 30
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 11
LDI r7, 90
LDI r8, 62
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 74
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
