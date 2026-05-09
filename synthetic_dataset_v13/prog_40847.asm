; DESCRIPTION: Composite: Draws a orange rectangle at (464, 242) with width 13 and height 13 then Draws a white circle centered at (177, 113) with radius 67 then Renders a green line between points (119, 231) and (323, 84).
; PLAN: r0=464(x), r1=242(y), r2=13(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x), r6=113(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=119(x1), r11=231(y1), r12=323(x2), r13=84(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 242
LDI r2, 13
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 113
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 119
LDI r11, 231
LDI r12, 323
LDI r13, 84
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
