; DESCRIPTION: Composite: Places a cyan dot at position (222, 156) then Renders a orange line between points (465, 73) and (104, 46) then Draws a red rectangle at (264, 199) with width 97 and height 28.
; PLAN: r0=222(x), r1=156(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=465(x1), r6=73(y1), r7=104(x2), r8=46(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=264(x), r11=199(y), r12=97(width), r13=28(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 156
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 465
LDI r6, 73
LDI r7, 104
LDI r8, 46
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 199
LDI r12, 97
LDI r13, 28
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
