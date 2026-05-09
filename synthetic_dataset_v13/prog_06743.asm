; DESCRIPTION: Composite: Draws a cyan line from (0, 241) to (219, 84) then Creates a red rectangular region at (351, 23) spanning 75 by 75 pixels.
; PLAN: r0=0(x1), r1=241(y1), r2=219(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=23(y), r7=75(width), r8=75(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 241
LDI r2, 219
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 23
LDI r7, 75
LDI r8, 75
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
