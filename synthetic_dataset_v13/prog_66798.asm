; DESCRIPTION: Composite: Sets a single blue pixel at (25, 161) then Renders a green line between points (59, 193) and (425, 56) then Draws a yellow rectangle at (301, 91) with width 90 and height 36.
; PLAN: r0=25(x), r1=161(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=59(x1), r6=193(y1), r7=425(x2), r8=56(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=301(x), r11=91(y), r12=90(width), r13=36(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 161
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 59
LDI r6, 193
LDI r7, 425
LDI r8, 56
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 91
LDI r12, 90
LDI r13, 36
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
