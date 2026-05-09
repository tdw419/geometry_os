; DESCRIPTION: Composite: Renders a red disk with center (279, 157) and radius 58 then Places a green dot at position (440, 147) then Draws a orange rectangle at (263, 206) with width 33 and height 36.
; PLAN: r0=279(x), r1=157(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=440(x), r6=147(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=263(x), r11=206(y), r12=33(width), r13=36(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 157
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 440
LDI r6, 147
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 263
LDI r11, 206
LDI r12, 33
LDI r13, 36
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
