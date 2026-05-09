; DESCRIPTION: Composite: Places a purple dot at position (144, 59) then Renders a red line between points (345, 50) and (122, 163) then Draws a magenta rectangle at (90, 14) with width 35 and height 102.
; PLAN: r0=144(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=345(x1), r6=50(y1), r7=122(x2), r8=163(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=14(y), r12=35(width), r13=102(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 59
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 50
LDI r7, 122
LDI r8, 163
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 14
LDI r12, 35
LDI r13, 102
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
