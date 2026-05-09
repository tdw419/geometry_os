; DESCRIPTION: Composite: Draws a orange line from (134, 52) to (504, 237) then Renders a blue disk with center (379, 187) and radius 40 then Draws a red rectangle at (61, 3) with width 20 and height 26.
; PLAN: r0=134(x1), r1=52(y1), r2=504(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=187(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=61(x), r11=3(y), r12=20(width), r13=26(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 52
LDI r2, 504
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 187
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 61
LDI r11, 3
LDI r12, 20
LDI r13, 26
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
