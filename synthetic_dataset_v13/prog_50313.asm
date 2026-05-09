; DESCRIPTION: Composite: Renders a magenta box of size 79x17 starting at (86, 145) then Places a red circle of radius 16 at center (248, 135) then Draws a blue line from (228, 43) to (368, 76).
; PLAN: r0=86(x), r1=145(y), r2=79(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=135(y), r7=16(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=228(x1), r11=43(y1), r12=368(x2), r13=76(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 145
LDI r2, 79
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 135
LDI r7, 16
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 228
LDI r11, 43
LDI r12, 368
LDI r13, 76
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
