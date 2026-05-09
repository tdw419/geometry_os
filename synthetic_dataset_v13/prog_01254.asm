; DESCRIPTION: Composite: Renders a yellow line between points (501, 95) and (255, 106) then Creates a magenta rectangular region at (447, 67) spanning 15 by 116 pixels.
; PLAN: r0=501(x1), r1=95(y1), r2=255(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=447(x), r6=67(y), r7=15(width), r8=116(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 501
LDI r1, 95
LDI r2, 255
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 67
LDI r7, 15
LDI r8, 116
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
