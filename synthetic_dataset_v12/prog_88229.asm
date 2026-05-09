; DESCRIPTION: Composite: Places a orange circle of radius 76 at center (337, 166) then Renders a blue line between points (294, 18) and (229, 179) then Draws a white rectangle at (370, 76) with width 27 and height 103.
; PLAN: r0=337(x), r1=166(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x1), r6=18(y1), r7=229(x2), r8=179(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=370(x), r11=76(y), r12=27(width), r13=103(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 166
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 18
LDI r7, 229
LDI r8, 179
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 76
LDI r12, 27
LDI r13, 103
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
