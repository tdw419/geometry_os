; DESCRIPTION: Composite: Draws a yellow line from (320, 14) to (91, 184) then Sets a single black pixel at (167, 47) then Renders a purple box of size 15x20 starting at (407, 161).
; PLAN: r0=320(x1), r1=14(y1), r2=91(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=47(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=407(x), r11=161(y), r12=15(width), r13=20(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 14
LDI r2, 91
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 47
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 407
LDI r11, 161
LDI r12, 15
LDI r13, 20
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
