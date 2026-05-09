; DESCRIPTION: Composite: Creates a red rectangular region at (409, 94) spanning 80 by 119 pixels then Draws a cyan line from (391, 150) to (236, 133) then Sets a single cyan pixel at (363, 126).
; PLAN: r0=409(x), r1=94(y), r2=80(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x1), r6=150(y1), r7=236(x2), r8=133(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=363(x), r11=126(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 94
LDI r2, 80
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 150
LDI r7, 236
LDI r8, 133
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 126
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
