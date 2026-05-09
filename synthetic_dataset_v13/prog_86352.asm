; DESCRIPTION: Composite: Renders a magenta line between points (316, 98) and (314, 195) then Renders a red box of size 29x69 starting at (179, 116) then Sets a single white pixel at (116, 247).
; PLAN: r0=316(x1), r1=98(y1), r2=314(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=116(y), r7=29(width), r8=69(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=116(x), r11=247(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 316
LDI r1, 98
LDI r2, 314
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 116
LDI r7, 29
LDI r8, 69
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 116
LDI r11, 247
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
