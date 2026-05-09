; DESCRIPTION: Composite: Places a yellow dot at position (63, 211) then Draws a magenta rectangle at (405, 89) with width 81 and height 33 then Draws a purple circle centered at (56, 67) with radius 56.
; PLAN: r0=63(x), r1=211(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=89(y), r7=81(width), r8=33(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=56(x), r11=67(y), r12=56(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 63
LDI r1, 211
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 405
LDI r6, 89
LDI r7, 81
LDI r8, 33
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 67
LDI r12, 56
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
