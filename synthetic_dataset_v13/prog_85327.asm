; DESCRIPTION: Composite: Sets a single blue pixel at (434, 205) then Draws a purple line from (305, 217) to (243, 88) then Places a orange circle of radius 11 at center (171, 198).
; PLAN: r0=434(x), r1=205(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=305(x1), r6=217(y1), r7=243(x2), r8=88(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=171(x), r11=198(y), r12=11(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 434
LDI r1, 205
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 217
LDI r7, 243
LDI r8, 88
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 198
LDI r12, 11
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
