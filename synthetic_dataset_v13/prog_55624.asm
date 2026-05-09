; DESCRIPTION: Composite: Places a cyan dot at position (381, 24) then Renders a black line between points (124, 26) and (297, 55) then Creates a red rectangular region at (431, 99) spanning 24 by 102 pixels.
; PLAN: r0=381(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=124(x1), r6=26(y1), r7=297(x2), r8=55(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=431(x), r11=99(y), r12=24(width), r13=102(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 124
LDI r6, 26
LDI r7, 297
LDI r8, 55
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 99
LDI r12, 24
LDI r13, 102
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
