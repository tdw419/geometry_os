; DESCRIPTION: Composite: Draws a cyan line from (359, 245) to (12, 90) then Draws a green rectangle at (149, 65) with width 84 and height 17.
; PLAN: r0=359(x1), r1=245(y1), r2=12(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=65(y), r7=84(width), r8=17(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 245
LDI r2, 12
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 65
LDI r7, 84
LDI r8, 17
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
