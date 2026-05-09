; DESCRIPTION: Composite: Creates a cyan rectangular region at (321, 69) spanning 105 by 43 pixels then Renders a blue line between points (396, 92) and (238, 248).
; PLAN: r0=321(x), r1=69(y), r2=105(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x1), r6=92(y1), r7=238(x2), r8=248(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 69
LDI r2, 105
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 92
LDI r7, 238
LDI r8, 248
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
