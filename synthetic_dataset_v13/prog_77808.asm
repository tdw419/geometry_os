; DESCRIPTION: Composite: Draws a magenta circle centered at (173, 127) with radius 51 then Places a yellow line segment connecting (217, 35) to (30, 25) then Draws a magenta rectangle at (92, 169) with width 94 and height 33.
; PLAN: r0=173(x), r1=127(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x1), r6=35(y1), r7=30(x2), r8=25(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=92(x), r11=169(y), r12=94(width), r13=33(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 127
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 35
LDI r7, 30
LDI r8, 25
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 169
LDI r12, 94
LDI r13, 33
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
