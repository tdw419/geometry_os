; DESCRIPTION: Composite: Creates a cyan rectangular region at (302, 2) spanning 118 by 53 pixels then Renders a yellow line between points (336, 165) and (122, 125).
; PLAN: r0=302(x), r1=2(y), r2=118(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x1), r6=165(y1), r7=122(x2), r8=125(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 2
LDI r2, 118
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 165
LDI r7, 122
LDI r8, 125
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
