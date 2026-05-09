; DESCRIPTION: Composite: Renders a red line between points (315, 97) and (275, 193) then Draws a cyan rectangle at (107, 194) with width 106 and height 44.
; PLAN: r0=315(x1), r1=97(y1), r2=275(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=194(y), r7=106(width), r8=44(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 97
LDI r2, 275
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 194
LDI r7, 106
LDI r8, 44
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
