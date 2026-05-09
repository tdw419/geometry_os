; DESCRIPTION: Composite: Places a magenta dot at position (169, 48) then Draws a cyan rectangle at (355, 100) with width 69 and height 33 then Draws a purple circle centered at (438, 123) with radius 36.
; PLAN: r0=169(x), r1=48(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=100(y), r7=69(width), r8=33(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x), r11=123(y), r12=36(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 169
LDI r1, 48
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 355
LDI r6, 100
LDI r7, 69
LDI r8, 33
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 123
LDI r12, 36
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
