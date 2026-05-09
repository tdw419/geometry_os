; DESCRIPTION: Composite: Creates a black rectangular region at (212, 177) spanning 45 by 62 pixels then Renders a white line between points (437, 162) and (2, 177).
; PLAN: r0=212(x), r1=177(y), r2=45(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x1), r6=162(y1), r7=2(x2), r8=177(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 177
LDI r2, 45
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 162
LDI r7, 2
LDI r8, 177
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
