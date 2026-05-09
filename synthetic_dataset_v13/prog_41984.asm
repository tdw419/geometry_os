; DESCRIPTION: Composite: Places a black dot at position (452, 240) then Renders a green box of size 97x80 starting at (130, 8) then Draws a purple circle centered at (445, 194) with radius 58.
; PLAN: r0=452(x), r1=240(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=8(y), r7=97(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=445(x), r11=194(y), r12=58(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 452
LDI r1, 240
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 130
LDI r6, 8
LDI r7, 97
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 194
LDI r12, 58
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
