; DESCRIPTION: Composite: Renders a yellow disk with center (426, 212) and radius 27 then Draws a purple rectangle at (252, 129) with width 28 and height 43 then Draws a green line from (10, 102) to (480, 162).
; PLAN: r0=426(x), r1=212(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x), r6=129(y), r7=28(width), r8=43(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=10(x1), r11=102(y1), r12=480(x2), r13=162(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 212
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 129
LDI r7, 28
LDI r8, 43
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 10
LDI r11, 102
LDI r12, 480
LDI r13, 162
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
