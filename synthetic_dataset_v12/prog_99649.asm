; DESCRIPTION: Composite: Places a green dot at position (130, 246) then Renders a orange box of size 16x108 starting at (384, 17) then Renders a purple line between points (449, 61) and (106, 130).
; PLAN: r0=130(x), r1=246(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=384(x), r6=17(y), r7=16(width), r8=108(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=449(x1), r11=61(y1), r12=106(x2), r13=130(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 246
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 384
LDI r6, 17
LDI r7, 16
LDI r8, 108
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 449
LDI r11, 61
LDI r12, 106
LDI r13, 130
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
