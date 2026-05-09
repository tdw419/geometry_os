; DESCRIPTION: Composite: Sets a single purple pixel at (323, 136) then Places a red circle of radius 63 at center (228, 97) then Draws a purple line from (482, 237) to (313, 95).
; PLAN: r0=323(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=228(x), r6=97(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=482(x1), r11=237(y1), r12=313(x2), r13=95(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 228
LDI r6, 97
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 482
LDI r11, 237
LDI r12, 313
LDI r13, 95
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
