; DESCRIPTION: Composite: Creates a white rectangular region at (40, 12) spanning 102 by 71 pixels then Draws a black line from (33, 176) to (141, 165).
; PLAN: r0=40(x), r1=12(y), r2=102(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=33(x1), r6=176(y1), r7=141(x2), r8=165(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 12
LDI r2, 102
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 176
LDI r7, 141
LDI r8, 165
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
