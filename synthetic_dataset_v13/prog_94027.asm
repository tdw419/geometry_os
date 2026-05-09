; DESCRIPTION: Composite: Places a magenta line segment connecting (232, 62) to (323, 98) then Creates a black rectangular region at (33, 58) spanning 104 by 69 pixels then Places a yellow dot at position (487, 62).
; PLAN: r0=232(x1), r1=62(y1), r2=323(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=58(y), r7=104(width), r8=69(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=487(x), r11=62(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 232
LDI r1, 62
LDI r2, 323
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 58
LDI r7, 104
LDI r8, 69
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 487
LDI r11, 62
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
