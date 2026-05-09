; DESCRIPTION: Composite: Places a purple dot at position (479, 170) then Draws a purple line from (83, 129) to (396, 53) then Draws a black rectangle at (374, 18) with width 62 and height 49.
; PLAN: r0=479(x), r1=170(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=83(x1), r6=129(y1), r7=396(x2), r8=53(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=374(x), r11=18(y), r12=62(width), r13=49(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 170
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 129
LDI r7, 396
LDI r8, 53
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 18
LDI r12, 62
LDI r13, 49
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
