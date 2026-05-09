; DESCRIPTION: Composite: Renders a magenta line between points (73, 255) and (255, 114) then Places a yellow 77x84 rectangle at position (191, 36) then Places a yellow circle of radius 25 at center (335, 118).
; PLAN: r0=73(x1), r1=255(y1), r2=255(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=36(y), r7=77(width), r8=84(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x), r11=118(y), r12=25(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 73
LDI r1, 255
LDI r2, 255
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 36
LDI r7, 77
LDI r8, 84
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 118
LDI r12, 25
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
