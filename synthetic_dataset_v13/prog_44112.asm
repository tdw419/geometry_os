; DESCRIPTION: Composite: Places a cyan dot at position (410, 118) then Places a purple line segment connecting (375, 34) to (339, 146) then Creates a cyan rectangular region at (146, 192) spanning 114 by 63 pixels.
; PLAN: r0=410(x), r1=118(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=375(x1), r6=34(y1), r7=339(x2), r8=146(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=192(y), r12=114(width), r13=63(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 118
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 375
LDI r6, 34
LDI r7, 339
LDI r8, 146
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 192
LDI r12, 114
LDI r13, 63
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
