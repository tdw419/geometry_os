; DESCRIPTION: Composite: Draws a magenta line from (335, 134) to (111, 136) then Creates a red circular shape at (262, 110) with radius 80 then Draws a cyan rectangle at (339, 103) with width 51 and height 73.
; PLAN: r0=335(x1), r1=134(y1), r2=111(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=110(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=339(x), r11=103(y), r12=51(width), r13=73(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 134
LDI r2, 111
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 110
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 339
LDI r11, 103
LDI r12, 51
LDI r13, 73
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
