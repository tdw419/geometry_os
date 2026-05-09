; DESCRIPTION: Composite: Places a purple line segment connecting (40, 136) to (434, 185) then Renders a blue box of size 65x26 starting at (66, 61) then Places a blue dot at position (194, 139).
; PLAN: r0=40(x1), r1=136(y1), r2=434(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=61(y), r7=65(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=194(x), r11=139(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 40
LDI r1, 136
LDI r2, 434
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 61
LDI r7, 65
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 139
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
