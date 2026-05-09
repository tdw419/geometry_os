; DESCRIPTION: Composite: Sets a single purple pixel at (455, 224) then Renders a orange box of size 33x102 starting at (110, 113) then Draws a red line from (441, 38) to (27, 185).
; PLAN: r0=455(x), r1=224(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=113(y), r7=33(width), r8=102(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x1), r11=38(y1), r12=27(x2), r13=185(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 455
LDI r1, 224
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 113
LDI r7, 33
LDI r8, 102
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 38
LDI r12, 27
LDI r13, 185
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
