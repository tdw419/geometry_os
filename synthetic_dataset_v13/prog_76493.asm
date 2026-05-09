; DESCRIPTION: Composite: Places a green dot at position (444, 147) then Renders a red box of size 97x18 starting at (370, 214) then Draws a red circle centered at (371, 154) with radius 35.
; PLAN: r0=444(x), r1=147(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=214(y), r7=97(width), r8=18(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=154(y), r12=35(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 444
LDI r1, 147
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 370
LDI r6, 214
LDI r7, 97
LDI r8, 18
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 154
LDI r12, 35
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
