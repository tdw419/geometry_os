; DESCRIPTION: Composite: Draws a cyan rectangle at (63, 102) with width 29 and height 70 then Renders a yellow disk with center (115, 88) and radius 77 then Renders a black line between points (400, 234) and (207, 146).
; PLAN: r0=63(x), r1=102(y), r2=29(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x), r6=88(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=400(x1), r11=234(y1), r12=207(x2), r13=146(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 102
LDI r2, 29
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 88
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 400
LDI r11, 234
LDI r12, 207
LDI r13, 146
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
