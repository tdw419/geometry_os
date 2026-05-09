; DESCRIPTION: Composite: Draws a magenta line from (356, 158) to (467, 178) then Draws a cyan rectangle at (62, 91) with width 73 and height 111 then Creates a red circular shape at (258, 90) with radius 33.
; PLAN: r0=356(x1), r1=158(y1), r2=467(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=91(y), r7=73(width), r8=111(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x), r11=90(y), r12=33(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 356
LDI r1, 158
LDI r2, 467
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 91
LDI r7, 73
LDI r8, 111
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 90
LDI r12, 33
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
