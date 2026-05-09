; DESCRIPTION: Composite: Places a purple dot at position (126, 231) then Places a blue line segment connecting (97, 192) to (342, 62) then Renders a orange disk with center (405, 128) and radius 63.
; PLAN: r0=126(x), r1=231(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=97(x1), r6=192(y1), r7=342(x2), r8=62(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=405(x), r11=128(y), r12=63(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 126
LDI r1, 231
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 97
LDI r6, 192
LDI r7, 342
LDI r8, 62
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 128
LDI r12, 63
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
