; DESCRIPTION: Composite: Creates a white rectangular region at (144, 118) spanning 76 by 77 pixels then Draws a red line from (387, 237) to (210, 76).
; PLAN: r0=144(x), r1=118(y), r2=76(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x1), r6=237(y1), r7=210(x2), r8=76(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 118
LDI r2, 76
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 237
LDI r7, 210
LDI r8, 76
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
