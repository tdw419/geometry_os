; DESCRIPTION: Composite: Draws a black rectangle at (370, 170) with width 37 and height 37 then Draws a white line from (339, 155) to (106, 251) then Renders a cyan disk with center (245, 191) and radius 64.
; PLAN: r0=370(x), r1=170(y), r2=37(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x1), r6=155(y1), r7=106(x2), r8=251(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=245(x), r11=191(y), r12=64(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 370
LDI r1, 170
LDI r2, 37
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 155
LDI r7, 106
LDI r8, 251
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 191
LDI r12, 64
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
