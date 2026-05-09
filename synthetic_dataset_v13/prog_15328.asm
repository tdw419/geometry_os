; DESCRIPTION: Composite: Renders a magenta line between points (209, 73) and (48, 218) then Creates a yellow rectangular region at (54, 89) spanning 72 by 81 pixels then Sets a single green pixel at (226, 252).
; PLAN: r0=209(x1), r1=73(y1), r2=48(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=89(y), r7=72(width), r8=81(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=226(x), r11=252(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 209
LDI r1, 73
LDI r2, 48
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 89
LDI r7, 72
LDI r8, 81
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 252
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
