; DESCRIPTION: Composite: Draws a purple line from (305, 246) to (279, 185) then Draws a purple rectangle at (59, 17) with width 50 and height 58 then Places a purple dot at position (102, 196).
; PLAN: r0=305(x1), r1=246(y1), r2=279(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=17(y), r7=50(width), r8=58(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=102(x), r11=196(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 305
LDI r1, 246
LDI r2, 279
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 17
LDI r7, 50
LDI r8, 58
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 196
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
