; DESCRIPTION: Composite: Creates a black rectangular region at (156, 45) spanning 44 by 109 pixels then Draws a orange line from (306, 65) to (294, 129).
; PLAN: r0=156(x), r1=45(y), r2=44(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x1), r6=65(y1), r7=294(x2), r8=129(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 45
LDI r2, 44
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 65
LDI r7, 294
LDI r8, 129
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
