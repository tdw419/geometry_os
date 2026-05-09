; DESCRIPTION: Composite: Places a blue circle of radius 33 at center (436, 147) then Draws a magenta line from (199, 230) to (204, 38) then Renders a purple box of size 58x89 starting at (356, 73).
; PLAN: r0=436(x), r1=147(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x1), r6=230(y1), r7=204(x2), r8=38(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=356(x), r11=73(y), r12=58(width), r13=89(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 147
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 230
LDI r7, 204
LDI r8, 38
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 73
LDI r12, 58
LDI r13, 89
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
