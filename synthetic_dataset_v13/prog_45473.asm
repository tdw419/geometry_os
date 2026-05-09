; DESCRIPTION: Composite: Draws a blue circle centered at (106, 137) with radius 51 then Renders a yellow line between points (449, 30) and (337, 163) then Draws a red rectangle at (184, 154) with width 41 and height 96.
; PLAN: r0=106(x), r1=137(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x1), r6=30(y1), r7=337(x2), r8=163(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=184(x), r11=154(y), r12=41(width), r13=96(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 137
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 30
LDI r7, 337
LDI r8, 163
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 154
LDI r12, 41
LDI r13, 96
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
