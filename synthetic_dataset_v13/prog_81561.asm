; DESCRIPTION: Composite: Creates a cyan rectangular region at (365, 67) spanning 94 by 78 pixels then Renders a white line between points (344, 170) and (139, 235) then Sets a single purple pixel at (396, 212).
; PLAN: r0=365(x), r1=67(y), r2=94(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x1), r6=170(y1), r7=139(x2), r8=235(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=212(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 365
LDI r1, 67
LDI r2, 94
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 170
LDI r7, 139
LDI r8, 235
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 212
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
