; DESCRIPTION: Composite: Renders a orange line between points (3, 165) and (450, 1) then Draws a cyan rectangle at (186, 119) with width 86 and height 77.
; PLAN: r0=3(x1), r1=165(y1), r2=450(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=119(y), r7=86(width), r8=77(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 165
LDI r2, 450
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 119
LDI r7, 86
LDI r8, 77
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
