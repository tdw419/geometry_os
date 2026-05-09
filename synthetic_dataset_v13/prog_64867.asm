; DESCRIPTION: Composite: Places a magenta 97x81 rectangle at position (357, 10) then Renders a white line between points (220, 114) and (188, 33) then Places a white circle of radius 51 at center (64, 196).
; PLAN: r0=357(x), r1=10(y), r2=97(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x1), r6=114(y1), r7=188(x2), r8=33(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=64(x), r11=196(y), r12=51(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 357
LDI r1, 10
LDI r2, 97
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 114
LDI r7, 188
LDI r8, 33
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 196
LDI r12, 51
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
