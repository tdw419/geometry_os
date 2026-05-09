; DESCRIPTION: Composite: Places a red dot at position (313, 246) then Renders a purple box of size 45x65 starting at (89, 31) then Renders a cyan disk with center (231, 136) and radius 40.
; PLAN: r0=313(x), r1=246(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=31(y), r7=45(width), r8=65(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=231(x), r11=136(y), r12=40(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 313
LDI r1, 246
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 89
LDI r6, 31
LDI r7, 45
LDI r8, 65
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 136
LDI r12, 40
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
