; DESCRIPTION: Composite: Draws a blue line from (247, 212) to (482, 96) then Renders a purple disk with center (347, 115) and radius 18 then Places a orange 35x92 rectangle at position (143, 2).
; PLAN: r0=247(x1), r1=212(y1), r2=482(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=115(y), r7=18(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x), r11=2(y), r12=35(width), r13=92(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 212
LDI r2, 482
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 115
LDI r7, 18
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 2
LDI r12, 35
LDI r13, 92
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
