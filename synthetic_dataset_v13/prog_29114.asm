; DESCRIPTION: Composite: Creates a red circular shape at (272, 156) with radius 60 then Draws a yellow line from (102, 190) to (339, 55).
; PLAN: r0=272(x), r1=156(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x1), r6=190(y1), r7=339(x2), r8=55(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 156
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 190
LDI r7, 339
LDI r8, 55
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
