; DESCRIPTION: Composite: Places a blue circle of radius 22 at center (144, 60) then Renders a white line between points (504, 194) and (46, 161) then Draws a orange rectangle at (169, 54) with width 61 and height 31.
; PLAN: r0=144(x), r1=60(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=504(x1), r6=194(y1), r7=46(x2), r8=161(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=169(x), r11=54(y), r12=61(width), r13=31(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 60
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 504
LDI r6, 194
LDI r7, 46
LDI r8, 161
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 54
LDI r12, 61
LDI r13, 31
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
