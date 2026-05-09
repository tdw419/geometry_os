; DESCRIPTION: Composite: Renders a red line between points (26, 217) and (392, 176) then Creates a yellow rectangular region at (270, 204) spanning 50 by 37 pixels.
; PLAN: r0=26(x1), r1=217(y1), r2=392(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=204(y), r7=50(width), r8=37(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 217
LDI r2, 392
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 204
LDI r7, 50
LDI r8, 37
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
