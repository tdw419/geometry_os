; DESCRIPTION: Composite: Draws a green line from (102, 113) to (339, 86) then Places a black dot at position (470, 126) then Creates a purple rectangular region at (246, 121) spanning 20 by 40 pixels.
; PLAN: r0=102(x1), r1=113(y1), r2=339(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=470(x), r6=126(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=246(x), r11=121(y), r12=20(width), r13=40(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 113
LDI r2, 339
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 126
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 246
LDI r11, 121
LDI r12, 20
LDI r13, 40
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
