; DESCRIPTION: Composite: Renders a red line between points (23, 207) and (301, 188) then Draws a cyan rectangle at (159, 77) with width 104 and height 119 then Places a red dot at position (14, 218).
; PLAN: r0=23(x1), r1=207(y1), r2=301(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=77(y), r7=104(width), r8=119(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=14(x), r11=218(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 23
LDI r1, 207
LDI r2, 301
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 77
LDI r7, 104
LDI r8, 119
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 14
LDI r11, 218
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
