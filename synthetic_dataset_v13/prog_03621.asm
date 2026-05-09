; DESCRIPTION: Composite: Sets a single magenta pixel at (373, 170) then Creates a green rectangular region at (115, 17) spanning 117 by 118 pixels then Places a cyan line segment connecting (499, 117) to (60, 11).
; PLAN: r0=373(x), r1=170(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=115(x), r6=17(y), r7=117(width), r8=118(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=499(x1), r11=117(y1), r12=60(x2), r13=11(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 170
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 115
LDI r6, 17
LDI r7, 117
LDI r8, 118
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 499
LDI r11, 117
LDI r12, 60
LDI r13, 11
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
