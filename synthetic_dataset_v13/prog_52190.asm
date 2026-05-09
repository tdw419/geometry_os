; DESCRIPTION: Composite: Draws a magenta line from (164, 3) to (349, 52) then Places a yellow dot at position (310, 186) then Creates a yellow rectangular region at (137, 126) spanning 31 by 33 pixels.
; PLAN: r0=164(x1), r1=3(y1), r2=349(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=186(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=137(x), r11=126(y), r12=31(width), r13=33(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 3
LDI r2, 349
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 186
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 137
LDI r11, 126
LDI r12, 31
LDI r13, 33
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
