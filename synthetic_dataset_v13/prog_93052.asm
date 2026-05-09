; DESCRIPTION: Composite: Places a yellow line segment connecting (416, 12) to (215, 49) then Creates a cyan rectangular region at (231, 114) spanning 43 by 13 pixels then Places a black dot at position (62, 50).
; PLAN: r0=416(x1), r1=12(y1), r2=215(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=114(y), r7=43(width), r8=13(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=62(x), r11=50(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 12
LDI r2, 215
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 114
LDI r7, 43
LDI r8, 13
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 50
LDI r12, 0x000000
PSET r10, r11, r12
HALT
