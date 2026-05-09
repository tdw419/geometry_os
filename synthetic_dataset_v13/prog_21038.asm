; DESCRIPTION: Composite: Sets a single yellow pixel at (328, 84) then Renders a orange box of size 83x90 starting at (136, 123) then Draws a black line from (193, 13) to (446, 139).
; PLAN: r0=328(x), r1=84(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=123(y), r7=83(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=193(x1), r11=13(y1), r12=446(x2), r13=139(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 84
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 136
LDI r6, 123
LDI r7, 83
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 13
LDI r12, 446
LDI r13, 139
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
