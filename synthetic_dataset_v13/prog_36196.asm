; DESCRIPTION: Composite: Renders a blue disk with center (33, 36) and radius 24 then Creates a cyan rectangular region at (232, 129) spanning 40 by 107 pixels then Draws a orange line from (337, 97) to (71, 237).
; PLAN: r0=33(x), r1=36(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x), r6=129(y), r7=40(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=337(x1), r11=97(y1), r12=71(x2), r13=237(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 33
LDI r1, 36
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 129
LDI r7, 40
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 97
LDI r12, 71
LDI r13, 237
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
