; DESCRIPTION: Composite: Places a cyan dot at position (453, 116) then Renders a red line between points (106, 117) and (364, 109) then Draws a green rectangle at (238, 106) with width 30 and height 15.
; PLAN: r0=453(x), r1=116(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=106(x1), r6=117(y1), r7=364(x2), r8=109(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=238(x), r11=106(y), r12=30(width), r13=15(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 116
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 117
LDI r7, 364
LDI r8, 109
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 106
LDI r12, 30
LDI r13, 15
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
