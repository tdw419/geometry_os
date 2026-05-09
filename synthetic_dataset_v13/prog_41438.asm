; DESCRIPTION: Composite: Sets a single magenta pixel at (77, 116) then Draws a magenta rectangle at (15, 123) with width 62 and height 80 then Places a cyan line segment connecting (478, 80) to (94, 129).
; PLAN: r0=77(x), r1=116(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=15(x), r6=123(y), r7=62(width), r8=80(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=478(x1), r11=80(y1), r12=94(x2), r13=129(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 116
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 15
LDI r6, 123
LDI r7, 62
LDI r8, 80
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 478
LDI r11, 80
LDI r12, 94
LDI r13, 129
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
