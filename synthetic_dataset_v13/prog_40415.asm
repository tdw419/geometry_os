; DESCRIPTION: Composite: Draws a purple circle centered at (310, 202) with radius 40 then Sets a single black pixel at (157, 167) then Draws a green line from (22, 221) to (252, 230).
; PLAN: r0=310(x), r1=202(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=167(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=22(x1), r11=221(y1), r12=252(x2), r13=230(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 202
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 167
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 22
LDI r11, 221
LDI r12, 252
LDI r13, 230
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
