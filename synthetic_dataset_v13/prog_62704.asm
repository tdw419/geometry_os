; DESCRIPTION: Composite: Sets a single cyan pixel at (6, 70) then Creates a yellow rectangular region at (304, 108) spanning 83 by 54 pixels then Renders a purple line between points (225, 116) and (291, 117).
; PLAN: r0=6(x), r1=70(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=304(x), r6=108(y), r7=83(width), r8=54(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=225(x1), r11=116(y1), r12=291(x2), r13=117(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 6
LDI r1, 70
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 304
LDI r6, 108
LDI r7, 83
LDI r8, 54
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 116
LDI r12, 291
LDI r13, 117
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
