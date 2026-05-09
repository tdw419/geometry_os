; DESCRIPTION: Composite: Places a green dot at position (10, 232) then Draws a red rectangle at (77, 176) with width 62 and height 80 then Draws a purple circle centered at (269, 192) with radius 50.
; PLAN: r0=10(x), r1=232(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=176(y), r7=62(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x), r11=192(y), r12=50(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 232
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 77
LDI r6, 176
LDI r7, 62
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 192
LDI r12, 50
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
