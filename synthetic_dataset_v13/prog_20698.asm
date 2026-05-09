; DESCRIPTION: Composite: Sets a single white pixel at (159, 54) then Renders a cyan line between points (331, 220) and (1, 81) then Creates a cyan rectangular region at (353, 177) spanning 114 by 78 pixels.
; PLAN: r0=159(x), r1=54(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=220(y1), r7=1(x2), r8=81(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=177(y), r12=114(width), r13=78(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 54
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 331
LDI r6, 220
LDI r7, 1
LDI r8, 81
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 177
LDI r12, 114
LDI r13, 78
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
