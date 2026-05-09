; DESCRIPTION: Composite: Places a magenta 20x87 rectangle at position (18, 143) then Renders a cyan line between points (46, 238) and (211, 176) then Sets a single white pixel at (78, 97).
; PLAN: r0=18(x), r1=143(y), r2=20(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=46(x1), r6=238(y1), r7=211(x2), r8=176(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=78(x), r11=97(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 18
LDI r1, 143
LDI r2, 20
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 238
LDI r7, 211
LDI r8, 176
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 97
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
