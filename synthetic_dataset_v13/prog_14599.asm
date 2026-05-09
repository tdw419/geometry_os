; DESCRIPTION: Composite: Places a green dot at position (379, 189) then Draws a cyan rectangle at (336, 126) with width 84 and height 53 then Creates a yellow circular shape at (224, 198) with radius 12.
; PLAN: r0=379(x), r1=189(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=126(y), r7=84(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=224(x), r11=198(y), r12=12(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 379
LDI r1, 189
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 336
LDI r6, 126
LDI r7, 84
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 198
LDI r12, 12
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
