; DESCRIPTION: Composite: Draws a cyan line from (339, 82) to (83, 205) then Places a black dot at position (388, 231) then Creates a white rectangular region at (158, 65) spanning 38 by 29 pixels.
; PLAN: r0=339(x1), r1=82(y1), r2=83(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=231(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=65(y), r12=38(width), r13=29(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 82
LDI r2, 83
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 231
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 158
LDI r11, 65
LDI r12, 38
LDI r13, 29
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
