; DESCRIPTION: Composite: Places a white dot at position (444, 123) then Draws a magenta rectangle at (59, 65) with width 103 and height 11 then Renders a green disk with center (425, 63) and radius 58.
; PLAN: r0=444(x), r1=123(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=65(y), r7=103(width), r8=11(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=425(x), r11=63(y), r12=58(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 444
LDI r1, 123
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 59
LDI r6, 65
LDI r7, 103
LDI r8, 11
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 63
LDI r12, 58
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
