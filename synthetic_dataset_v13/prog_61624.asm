; DESCRIPTION: Composite: Sets a single green pixel at (320, 161) then Renders a red line between points (34, 139) and (229, 217) then Renders a magenta box of size 65x106 starting at (21, 101).
; PLAN: r0=320(x), r1=161(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=34(x1), r6=139(y1), r7=229(x2), r8=217(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=21(x), r11=101(y), r12=65(width), r13=106(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 161
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 34
LDI r6, 139
LDI r7, 229
LDI r8, 217
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 21
LDI r11, 101
LDI r12, 65
LDI r13, 106
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
