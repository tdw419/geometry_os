; DESCRIPTION: Composite: Creates a purple rectangular region at (16, 78) spanning 81 by 26 pixels then Renders a green line between points (57, 157) and (44, 249).
; PLAN: r0=16(x), r1=78(y), r2=81(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x1), r6=157(y1), r7=44(x2), r8=249(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 16
LDI r1, 78
LDI r2, 81
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 157
LDI r7, 44
LDI r8, 249
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
