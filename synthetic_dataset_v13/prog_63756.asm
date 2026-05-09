; DESCRIPTION: Composite: Creates a yellow rectangular region at (222, 54) spanning 117 by 80 pixels then Renders a cyan line between points (441, 17) and (157, 198).
; PLAN: r0=222(x), r1=54(y), r2=117(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x1), r6=17(y1), r7=157(x2), r8=198(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 54
LDI r2, 117
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 17
LDI r7, 157
LDI r8, 198
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
