; DESCRIPTION: Composite: Renders a yellow box of size 29x73 starting at (5, 101) then Sets a single purple pixel at (363, 43) then Draws a white line from (50, 187) to (388, 252).
; PLAN: r0=5(x), r1=101(y), r2=29(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=43(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=50(x1), r11=187(y1), r12=388(x2), r13=252(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 101
LDI r2, 29
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 43
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 50
LDI r11, 187
LDI r12, 388
LDI r13, 252
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
