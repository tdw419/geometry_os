; DESCRIPTION: Composite: Places a white dot at position (418, 139) then Renders a red line between points (286, 216) and (99, 247) then Creates a cyan rectangular region at (174, 158) spanning 62 by 91 pixels.
; PLAN: r0=418(x), r1=139(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=286(x1), r6=216(y1), r7=99(x2), r8=247(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=174(x), r11=158(y), r12=62(width), r13=91(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 139
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 286
LDI r6, 216
LDI r7, 99
LDI r8, 247
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 158
LDI r12, 62
LDI r13, 91
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
