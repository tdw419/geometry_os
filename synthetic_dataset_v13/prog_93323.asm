; DESCRIPTION: Composite: Creates a red rectangular region at (230, 99) spanning 91 by 94 pixels then Draws a white line from (319, 55) to (367, 40).
; PLAN: r0=230(x), r1=99(y), r2=91(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x1), r6=55(y1), r7=367(x2), r8=40(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 99
LDI r2, 91
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 55
LDI r7, 367
LDI r8, 40
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
