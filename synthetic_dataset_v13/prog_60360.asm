; DESCRIPTION: Composite: Draws a white rectangle at (30, 53) with width 98 and height 97 then Draws a purple line from (71, 190) to (382, 153) then Creates a yellow circular shape at (368, 122) with radius 58.
; PLAN: r0=30(x), r1=53(y), r2=98(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x1), r6=190(y1), r7=382(x2), r8=153(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=368(x), r11=122(y), r12=58(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 30
LDI r1, 53
LDI r2, 98
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 190
LDI r7, 382
LDI r8, 153
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 122
LDI r12, 58
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
