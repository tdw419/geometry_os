; DESCRIPTION: Composite: Creates a magenta rectangular region at (230, 132) spanning 106 by 89 pixels then Renders a red line between points (126, 209) and (154, 185) then Sets a single cyan pixel at (37, 200).
; PLAN: r0=230(x), r1=132(y), r2=106(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x1), r6=209(y1), r7=154(x2), r8=185(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=37(x), r11=200(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 230
LDI r1, 132
LDI r2, 106
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 209
LDI r7, 154
LDI r8, 185
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 200
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
