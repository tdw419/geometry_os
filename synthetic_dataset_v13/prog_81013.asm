; DESCRIPTION: Composite: Places a blue dot at position (248, 226) then Renders a green disk with center (409, 152) and radius 13 then Draws a red rectangle at (384, 46) with width 50 and height 63.
; PLAN: r0=248(x), r1=226(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=152(y), r7=13(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=384(x), r11=46(y), r12=50(width), r13=63(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 226
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 409
LDI r6, 152
LDI r7, 13
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 384
LDI r11, 46
LDI r12, 50
LDI r13, 63
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
