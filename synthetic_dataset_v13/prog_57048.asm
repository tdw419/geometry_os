; DESCRIPTION: Composite: Sets a single purple pixel at (251, 115) then Renders a red line between points (274, 167) and (218, 4) then Creates a magenta rectangular region at (409, 134) spanning 86 by 91 pixels.
; PLAN: r0=251(x), r1=115(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=274(x1), r6=167(y1), r7=218(x2), r8=4(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=134(y), r12=86(width), r13=91(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 115
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 274
LDI r6, 167
LDI r7, 218
LDI r8, 4
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 134
LDI r12, 86
LDI r13, 91
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
