; DESCRIPTION: Composite: Places a blue line segment connecting (149, 170) to (420, 140) then Draws a yellow rectangle at (224, 190) with width 23 and height 15 then Places a cyan circle of radius 62 at center (443, 176).
; PLAN: r0=149(x1), r1=170(y1), r2=420(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=190(y), r7=23(width), r8=15(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=443(x), r11=176(y), r12=62(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 149
LDI r1, 170
LDI r2, 420
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 190
LDI r7, 23
LDI r8, 15
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 176
LDI r12, 62
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
