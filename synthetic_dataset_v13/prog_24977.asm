; DESCRIPTION: Composite: Places a orange line segment connecting (7, 8) to (112, 96) then Places a cyan 27x59 rectangle at position (318, 119) then Renders a green disk with center (107, 173) and radius 68.
; PLAN: r0=7(x1), r1=8(y1), r2=112(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=119(y), r7=27(width), r8=59(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x), r11=173(y), r12=68(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 7
LDI r1, 8
LDI r2, 112
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 119
LDI r7, 27
LDI r8, 59
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 173
LDI r12, 68
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
