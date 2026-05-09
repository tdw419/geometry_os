; DESCRIPTION: Composite: Draws a red line from (270, 106) to (349, 65) then Renders a blue box of size 77x28 starting at (383, 8) then Sets a single green pixel at (82, 84).
; PLAN: r0=270(x1), r1=106(y1), r2=349(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=8(y), r7=77(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=82(x), r11=84(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 270
LDI r1, 106
LDI r2, 349
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 8
LDI r7, 77
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 84
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
