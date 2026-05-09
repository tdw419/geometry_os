; DESCRIPTION: Composite: Creates a blue rectangular region at (317, 209) spanning 40 by 18 pixels then Places a purple circle of radius 26 at center (446, 40) then Places a orange line segment connecting (141, 190) to (39, 225).
; PLAN: r0=317(x), r1=209(y), r2=40(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=40(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=141(x1), r11=190(y1), r12=39(x2), r13=225(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 209
LDI r2, 40
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 40
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 141
LDI r11, 190
LDI r12, 39
LDI r13, 225
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
