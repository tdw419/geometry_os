; DESCRIPTION: Composite: Draws a cyan line from (185, 173) to (190, 118) then Draws a black rectangle at (395, 182) with width 49 and height 59.
; PLAN: r0=185(x1), r1=173(y1), r2=190(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=182(y), r7=49(width), r8=59(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 173
LDI r2, 190
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 182
LDI r7, 49
LDI r8, 59
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
