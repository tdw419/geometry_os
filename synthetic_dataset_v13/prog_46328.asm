; DESCRIPTION: Composite: Places a magenta dot at position (364, 187) then Draws a black rectangle at (454, 180) with width 54 and height 48 then Renders a yellow disk with center (343, 126) and radius 69.
; PLAN: r0=364(x), r1=187(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=180(y), r7=54(width), r8=48(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x), r11=126(y), r12=69(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 364
LDI r1, 187
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 454
LDI r6, 180
LDI r7, 54
LDI r8, 48
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 126
LDI r12, 69
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
