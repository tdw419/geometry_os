; DESCRIPTION: Composite: Creates a white rectangular region at (140, 140) spanning 28 by 70 pixels then Renders a green line between points (319, 65) and (148, 87).
; PLAN: r0=140(x), r1=140(y), r2=28(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x1), r6=65(y1), r7=148(x2), r8=87(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 140
LDI r2, 28
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 65
LDI r7, 148
LDI r8, 87
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
