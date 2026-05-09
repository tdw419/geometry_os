; DESCRIPTION: Composite: Sets a single yellow pixel at (155, 99) then Creates a orange rectangular region at (159, 9) spanning 73 by 102 pixels then Places a cyan line segment connecting (374, 231) to (53, 32).
; PLAN: r0=155(x), r1=99(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=9(y), r7=73(width), r8=102(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x1), r11=231(y1), r12=53(x2), r13=32(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 99
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 159
LDI r6, 9
LDI r7, 73
LDI r8, 102
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 231
LDI r12, 53
LDI r13, 32
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
