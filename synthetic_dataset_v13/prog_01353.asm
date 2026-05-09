; DESCRIPTION: Composite: Draws a purple rectangle at (236, 145) with width 111 and height 71 then Sets a single black pixel at (423, 11) then Renders a green line between points (284, 52) and (311, 98).
; PLAN: r0=236(x), r1=145(y), r2=111(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=11(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=284(x1), r11=52(y1), r12=311(x2), r13=98(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 145
LDI r2, 111
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 11
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 284
LDI r11, 52
LDI r12, 311
LDI r13, 98
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
