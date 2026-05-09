; DESCRIPTION: Composite: Places a magenta line segment connecting (254, 146) to (480, 101) then Renders a black box of size 84x69 starting at (47, 153) then Sets a single red pixel at (175, 154).
; PLAN: r0=254(x1), r1=146(y1), r2=480(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=47(x), r6=153(y), r7=84(width), r8=69(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=175(x), r11=154(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 254
LDI r1, 146
LDI r2, 480
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 153
LDI r7, 84
LDI r8, 69
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 154
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
