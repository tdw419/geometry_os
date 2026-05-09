; DESCRIPTION: Composite: Creates a white rectangular region at (359, 75) spanning 71 by 70 pixels then Draws a cyan line from (283, 76) to (3, 90).
; PLAN: r0=359(x), r1=75(y), r2=71(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x1), r6=76(y1), r7=3(x2), r8=90(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 75
LDI r2, 71
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 76
LDI r7, 3
LDI r8, 90
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
