; DESCRIPTION: Composite: Creates a white rectangular region at (49, 162) spanning 98 by 13 pixels then Draws a cyan line from (265, 35) to (19, 79).
; PLAN: r0=49(x), r1=162(y), r2=98(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x1), r6=35(y1), r7=19(x2), r8=79(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 162
LDI r2, 98
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 35
LDI r7, 19
LDI r8, 79
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
