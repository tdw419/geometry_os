; DESCRIPTION: Composite: Renders a red line between points (190, 245) and (14, 42) then Draws a cyan rectangle at (372, 156) with width 31 and height 77 then Sets a single red pixel at (239, 85).
; PLAN: r0=190(x1), r1=245(y1), r2=14(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=156(y), r7=31(width), r8=77(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x), r11=85(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 245
LDI r2, 14
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 156
LDI r7, 31
LDI r8, 77
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 85
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
