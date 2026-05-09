; DESCRIPTION: Composite: Draws a cyan line from (174, 132) to (409, 175) then Creates a orange rectangular region at (276, 36) spanning 83 by 108 pixels.
; PLAN: r0=174(x1), r1=132(y1), r2=409(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=36(y), r7=83(width), r8=108(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 132
LDI r2, 409
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 36
LDI r7, 83
LDI r8, 108
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
