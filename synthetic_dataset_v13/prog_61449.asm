; DESCRIPTION: Composite: Places a magenta line segment connecting (172, 96) to (507, 148) then Draws a cyan rectangle at (146, 150) with width 97 and height 67 then Renders a green disk with center (205, 82) and radius 24.
; PLAN: r0=172(x1), r1=96(y1), r2=507(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=150(y), r7=97(width), r8=67(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x), r11=82(y), r12=24(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 172
LDI r1, 96
LDI r2, 507
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 150
LDI r7, 97
LDI r8, 67
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 82
LDI r12, 24
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
