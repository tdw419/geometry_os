; DESCRIPTION: Composite: Draws a purple rectangle at (77, 7) with width 44 and height 106 then Places a green line segment connecting (495, 59) to (118, 109) then Draws a magenta circle centered at (294, 166) with radius 77.
; PLAN: r0=77(x), r1=7(y), r2=44(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x1), r6=59(y1), r7=118(x2), r8=109(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=294(x), r11=166(y), r12=77(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 77
LDI r1, 7
LDI r2, 44
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 59
LDI r7, 118
LDI r8, 109
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 166
LDI r12, 77
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
