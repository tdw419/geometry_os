; DESCRIPTION: Composite: Places a green dot at position (78, 211) then Places a black 56x43 rectangle at position (48, 169) then Draws a green circle centered at (327, 170) with radius 24.
; PLAN: r0=78(x), r1=211(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=48(x), r6=169(y), r7=56(width), r8=43(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=327(x), r11=170(y), r12=24(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 78
LDI r1, 211
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 48
LDI r6, 169
LDI r7, 56
LDI r8, 43
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 170
LDI r12, 24
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
