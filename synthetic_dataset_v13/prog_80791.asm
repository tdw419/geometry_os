; DESCRIPTION: Composite: Renders a orange box of size 62x46 starting at (368, 74) then Draws a yellow line from (253, 175) to (466, 213) then Renders a blue disk with center (339, 62) and radius 38.
; PLAN: r0=368(x), r1=74(y), r2=62(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x1), r6=175(y1), r7=466(x2), r8=213(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=339(x), r11=62(y), r12=38(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 368
LDI r1, 74
LDI r2, 62
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 175
LDI r7, 466
LDI r8, 213
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 62
LDI r12, 38
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
