; DESCRIPTION: Composite: Creates a red rectangular region at (337, 74) spanning 19 by 69 pixels then Renders a magenta line between points (359, 95) and (116, 31) then Sets a single purple pixel at (333, 184).
; PLAN: r0=337(x), r1=74(y), r2=19(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x1), r6=95(y1), r7=116(x2), r8=31(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=184(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 74
LDI r2, 19
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 95
LDI r7, 116
LDI r8, 31
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 184
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
