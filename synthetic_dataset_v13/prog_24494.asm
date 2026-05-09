; DESCRIPTION: Composite: Places a magenta dot at position (71, 244) then Creates a black rectangular region at (258, 2) spanning 58 by 26 pixels then Renders a white line between points (231, 163) and (172, 139).
; PLAN: r0=71(x), r1=244(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=258(x), r6=2(y), r7=58(width), r8=26(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=231(x1), r11=163(y1), r12=172(x2), r13=139(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 71
LDI r1, 244
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 258
LDI r6, 2
LDI r7, 58
LDI r8, 26
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 163
LDI r12, 172
LDI r13, 139
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
