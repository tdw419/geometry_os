; DESCRIPTION: Composite: Places a red line segment connecting (337, 89) to (190, 122) then Creates a white rectangular region at (178, 200) spanning 93 by 39 pixels.
; PLAN: r0=337(x1), r1=89(y1), r2=190(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=200(y), r7=93(width), r8=39(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 89
LDI r2, 190
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 200
LDI r7, 93
LDI r8, 39
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
