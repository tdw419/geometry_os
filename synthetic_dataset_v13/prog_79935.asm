; DESCRIPTION: Composite: Creates a yellow rectangular region at (110, 36) spanning 115 by 44 pixels then Draws a white line from (321, 242) to (149, 144).
; PLAN: r0=110(x), r1=36(y), r2=115(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=242(y1), r7=149(x2), r8=144(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 36
LDI r2, 115
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 242
LDI r7, 149
LDI r8, 144
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
