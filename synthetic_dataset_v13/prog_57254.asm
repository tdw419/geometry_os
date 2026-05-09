; DESCRIPTION: Composite: Draws a red circle centered at (102, 80) with radius 63 then Renders a white line between points (384, 232) and (337, 190) then Renders a green box of size 22x20 starting at (366, 74).
; PLAN: r0=102(x), r1=80(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x1), r6=232(y1), r7=337(x2), r8=190(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=366(x), r11=74(y), r12=22(width), r13=20(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 80
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 232
LDI r7, 337
LDI r8, 190
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 74
LDI r12, 22
LDI r13, 20
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
