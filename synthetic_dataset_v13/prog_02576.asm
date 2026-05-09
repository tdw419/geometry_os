; DESCRIPTION: Composite: Draws a purple line from (200, 15) to (504, 6) then Renders a orange box of size 83x14 starting at (137, 114) then Sets a single magenta pixel at (474, 143).
; PLAN: r0=200(x1), r1=15(y1), r2=504(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=114(y), r7=83(width), r8=14(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=474(x), r11=143(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 15
LDI r2, 504
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 114
LDI r7, 83
LDI r8, 14
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 474
LDI r11, 143
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
