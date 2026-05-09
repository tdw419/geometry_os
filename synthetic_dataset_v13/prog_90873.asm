; DESCRIPTION: Composite: Draws a cyan line from (25, 122) to (147, 67) then Draws a magenta rectangle at (350, 112) with width 111 and height 111 then Places a yellow circle of radius 42 at center (426, 154).
; PLAN: r0=25(x1), r1=122(y1), r2=147(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=112(y), r7=111(width), r8=111(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=426(x), r11=154(y), r12=42(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 122
LDI r2, 147
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 112
LDI r7, 111
LDI r8, 111
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 154
LDI r12, 42
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
