; DESCRIPTION: Composite: Renders a cyan box of size 16x88 starting at (223, 99) then Renders a white disk with center (123, 175) and radius 65 then Draws a purple line from (306, 63) to (15, 107).
; PLAN: r0=223(x), r1=99(y), r2=16(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=175(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x1), r11=63(y1), r12=15(x2), r13=107(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 99
LDI r2, 16
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 175
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 63
LDI r12, 15
LDI r13, 107
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
