; DESCRIPTION: Composite: Draws a cyan line from (417, 59) to (456, 178) then Creates a purple rectangular region at (1, 34) spanning 119 by 52 pixels.
; PLAN: r0=417(x1), r1=59(y1), r2=456(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=1(x), r6=34(y), r7=119(width), r8=52(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 59
LDI r2, 456
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 34
LDI r7, 119
LDI r8, 52
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
