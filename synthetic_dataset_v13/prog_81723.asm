; DESCRIPTION: Composite: Renders a orange line between points (223, 108) and (462, 255) then Draws a cyan rectangle at (369, 78) with width 107 and height 42.
; PLAN: r0=223(x1), r1=108(y1), r2=462(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=78(y), r7=107(width), r8=42(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 108
LDI r2, 462
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 78
LDI r7, 107
LDI r8, 42
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
