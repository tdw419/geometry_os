; DESCRIPTION: Composite: Places a green dot at position (301, 236) then Places a yellow line segment connecting (90, 246) to (36, 26) then Draws a white rectangle at (415, 127) with width 66 and height 106.
; PLAN: r0=301(x), r1=236(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=90(x1), r6=246(y1), r7=36(x2), r8=26(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=415(x), r11=127(y), r12=66(width), r13=106(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 236
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 90
LDI r6, 246
LDI r7, 36
LDI r8, 26
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 127
LDI r12, 66
LDI r13, 106
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
