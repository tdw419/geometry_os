; DESCRIPTION: Composite: Creates a cyan rectangular region at (279, 73) spanning 102 by 42 pixels then Renders a red line between points (163, 180) and (418, 15) then Sets a single purple pixel at (26, 90).
; PLAN: r0=279(x), r1=73(y), r2=102(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x1), r6=180(y1), r7=418(x2), r8=15(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=26(x), r11=90(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 279
LDI r1, 73
LDI r2, 102
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 180
LDI r7, 418
LDI r8, 15
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 90
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
