; DESCRIPTION: Composite: Draws a red line from (46, 244) to (119, 231) then Renders a yellow disk with center (209, 125) and radius 18 then Draws a green rectangle at (373, 151) with width 61 and height 89.
; PLAN: r0=46(x1), r1=244(y1), r2=119(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=125(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x), r11=151(y), r12=61(width), r13=89(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 244
LDI r2, 119
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 125
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 151
LDI r12, 61
LDI r13, 89
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
