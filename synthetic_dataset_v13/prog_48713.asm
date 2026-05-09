; DESCRIPTION: Composite: Sets a single yellow pixel at (335, 251) then Places a yellow line segment connecting (374, 124) to (129, 153) then Draws a cyan rectangle at (408, 143) with width 102 and height 44.
; PLAN: r0=335(x), r1=251(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=374(x1), r6=124(y1), r7=129(x2), r8=153(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=408(x), r11=143(y), r12=102(width), r13=44(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 251
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 374
LDI r6, 124
LDI r7, 129
LDI r8, 153
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 143
LDI r12, 102
LDI r13, 44
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
