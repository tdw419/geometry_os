; DESCRIPTION: Composite: Sets a single orange pixel at (20, 72) then Renders a magenta box of size 49x62 starting at (222, 185) then Places a blue line segment connecting (92, 29) to (104, 193).
; PLAN: r0=20(x), r1=72(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=222(x), r6=185(y), r7=49(width), r8=62(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=92(x1), r11=29(y1), r12=104(x2), r13=193(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 72
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 222
LDI r6, 185
LDI r7, 49
LDI r8, 62
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 29
LDI r12, 104
LDI r13, 193
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
