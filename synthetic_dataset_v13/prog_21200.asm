; DESCRIPTION: Composite: Sets a single black pixel at (498, 171) then Places a magenta line segment connecting (252, 215) to (14, 65) then Places a purple circle of radius 40 at center (58, 195).
; PLAN: r0=498(x), r1=171(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=252(x1), r6=215(y1), r7=14(x2), r8=65(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=58(x), r11=195(y), r12=40(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 498
LDI r1, 171
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 252
LDI r6, 215
LDI r7, 14
LDI r8, 65
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 195
LDI r12, 40
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
