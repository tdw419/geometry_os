; DESCRIPTION: Composite: Places a white line segment connecting (470, 4) to (447, 4) then Creates a magenta rectangular region at (352, 139) spanning 43 by 54 pixels then Places a yellow dot at position (281, 86).
; PLAN: r0=470(x1), r1=4(y1), r2=447(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=139(y), r7=43(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=281(x), r11=86(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 470
LDI r1, 4
LDI r2, 447
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 139
LDI r7, 43
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 86
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
