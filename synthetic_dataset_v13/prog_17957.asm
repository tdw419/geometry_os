; DESCRIPTION: Composite: Places a red dot at position (294, 114) then Draws a purple line from (209, 228) to (407, 113) then Draws a red circle centered at (359, 175) with radius 79.
; PLAN: r0=294(x), r1=114(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=209(x1), r6=228(y1), r7=407(x2), r8=113(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=359(x), r11=175(y), r12=79(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 294
LDI r1, 114
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 209
LDI r6, 228
LDI r7, 407
LDI r8, 113
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 175
LDI r12, 79
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
