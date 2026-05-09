; DESCRIPTION: Composite: Places a magenta circle of radius 49 at center (230, 166) then Renders a green line between points (229, 70) and (243, 97) then Creates a red rectangular region at (19, 114) spanning 88 by 74 pixels.
; PLAN: r0=230(x), r1=166(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x1), r6=70(y1), r7=243(x2), r8=97(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=19(x), r11=114(y), r12=88(width), r13=74(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 166
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 70
LDI r7, 243
LDI r8, 97
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 114
LDI r12, 88
LDI r13, 74
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
