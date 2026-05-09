; DESCRIPTION: Composite: Draws a yellow rectangle at (26, 144) with width 113 and height 102 then Places a green dot at position (206, 66) then Draws a red circle centered at (201, 152) with radius 59.
; PLAN: r0=26(x), r1=144(y), r2=113(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=66(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=201(x), r11=152(y), r12=59(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 26
LDI r1, 144
LDI r2, 113
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 66
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 201
LDI r11, 152
LDI r12, 59
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
