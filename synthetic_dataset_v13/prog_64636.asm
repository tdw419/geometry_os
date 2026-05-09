; DESCRIPTION: Composite: Places a purple dot at position (443, 195) then Creates a magenta rectangular region at (111, 84) spanning 20 by 71 pixels then Draws a magenta line from (478, 227) to (457, 82).
; PLAN: r0=443(x), r1=195(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=84(y), r7=20(width), r8=71(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=478(x1), r11=227(y1), r12=457(x2), r13=82(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 195
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 111
LDI r6, 84
LDI r7, 20
LDI r8, 71
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 478
LDI r11, 227
LDI r12, 457
LDI r13, 82
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
