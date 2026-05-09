; DESCRIPTION: Composite: Draws a black rectangle at (349, 148) with width 70 and height 46 then Places a red dot at position (474, 206) then Places a black line segment connecting (418, 216) to (389, 86).
; PLAN: r0=349(x), r1=148(y), r2=70(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x), r6=206(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=418(x1), r11=216(y1), r12=389(x2), r13=86(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 148
LDI r2, 70
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 206
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 418
LDI r11, 216
LDI r12, 389
LDI r13, 86
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
