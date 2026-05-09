; DESCRIPTION: Composite: Sets a single red pixel at (349, 147) then Draws a orange line from (287, 197) to (297, 45) then Creates a yellow rectangular region at (260, 146) spanning 92 by 60 pixels.
; PLAN: r0=349(x), r1=147(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=287(x1), r6=197(y1), r7=297(x2), r8=45(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=260(x), r11=146(y), r12=92(width), r13=60(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 147
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 287
LDI r6, 197
LDI r7, 297
LDI r8, 45
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 146
LDI r12, 92
LDI r13, 60
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
