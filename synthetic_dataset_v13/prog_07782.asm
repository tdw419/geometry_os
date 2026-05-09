; DESCRIPTION: Composite: Places a blue dot at position (95, 138) then Places a blue line segment connecting (154, 154) to (368, 16) then Draws a magenta rectangle at (373, 20) with width 22 and height 19.
; PLAN: r0=95(x), r1=138(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=154(x1), r6=154(y1), r7=368(x2), r8=16(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=20(y), r12=22(width), r13=19(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 95
LDI r1, 138
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 154
LDI r6, 154
LDI r7, 368
LDI r8, 16
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 20
LDI r12, 22
LDI r13, 19
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
