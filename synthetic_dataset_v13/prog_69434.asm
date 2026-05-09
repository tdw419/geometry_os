; DESCRIPTION: Composite: Draws a cyan line from (314, 65) to (478, 88) then Creates a purple rectangular region at (33, 168) spanning 114 by 66 pixels.
; PLAN: r0=314(x1), r1=65(y1), r2=478(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=168(y), r7=114(width), r8=66(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 65
LDI r2, 478
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 168
LDI r7, 114
LDI r8, 66
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
