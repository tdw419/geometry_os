; DESCRIPTION: Composite: Draws a red rectangle at (17, 214) with width 78 and height 40 then Places a blue dot at position (490, 16) then Draws a cyan line from (315, 198) to (219, 26).
; PLAN: r0=17(x), r1=214(y), r2=78(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=16(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=315(x1), r11=198(y1), r12=219(x2), r13=26(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 17
LDI r1, 214
LDI r2, 78
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 16
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 315
LDI r11, 198
LDI r12, 219
LDI r13, 26
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
