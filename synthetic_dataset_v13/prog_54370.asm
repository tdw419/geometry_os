; DESCRIPTION: Composite: Draws a white line from (11, 187) to (319, 75) then Creates a black rectangular region at (57, 33) spanning 79 by 115 pixels.
; PLAN: r0=11(x1), r1=187(y1), r2=319(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=33(y), r7=79(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 11
LDI r1, 187
LDI r2, 319
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 33
LDI r7, 79
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
