; DESCRIPTION: Composite: Creates a cyan circular shape at (100, 114) with radius 54 then Renders a purple line between points (226, 55) and (13, 161) then Draws a green rectangle at (8, 57) with width 118 and height 112.
; PLAN: r0=100(x), r1=114(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x1), r6=55(y1), r7=13(x2), r8=161(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=8(x), r11=57(y), r12=118(width), r13=112(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 114
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 55
LDI r7, 13
LDI r8, 161
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 8
LDI r11, 57
LDI r12, 118
LDI r13, 112
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
