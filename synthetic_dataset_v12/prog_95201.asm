; DESCRIPTION: Composite: Creates a black rectangular region at (326, 26) spanning 10 by 108 pixels then Draws a purple line from (470, 8) to (247, 28) then Draws a green circle centered at (194, 221) with radius 25.
; PLAN: r0=326(x), r1=26(y), r2=10(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x1), r6=8(y1), r7=247(x2), r8=28(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=221(y), r12=25(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 326
LDI r1, 26
LDI r2, 10
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 8
LDI r7, 247
LDI r8, 28
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 221
LDI r12, 25
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
