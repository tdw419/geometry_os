; DESCRIPTION: Composite: Draws a yellow line from (323, 28) to (41, 42) then Creates a black rectangular region at (185, 79) spanning 18 by 117 pixels.
; PLAN: r0=323(x1), r1=28(y1), r2=41(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=79(y), r7=18(width), r8=117(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 28
LDI r2, 41
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 79
LDI r7, 18
LDI r8, 117
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
