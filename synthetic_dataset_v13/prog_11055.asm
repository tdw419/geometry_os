; DESCRIPTION: Composite: Renders a magenta box of size 14x25 starting at (35, 158) then Draws a cyan circle centered at (344, 114) with radius 40 then Renders a green line between points (454, 207) and (145, 17).
; PLAN: r0=35(x), r1=158(y), r2=14(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x), r6=114(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=454(x1), r11=207(y1), r12=145(x2), r13=17(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 158
LDI r2, 14
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 114
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 454
LDI r11, 207
LDI r12, 145
LDI r13, 17
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
