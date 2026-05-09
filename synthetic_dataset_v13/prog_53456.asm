; DESCRIPTION: Composite: Places a yellow line segment connecting (401, 116) to (108, 10) then Places a yellow 40x51 rectangle at position (341, 137) then Places a blue circle of radius 27 at center (319, 74).
; PLAN: r0=401(x1), r1=116(y1), r2=108(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=137(y), r7=40(width), r8=51(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=74(y), r12=27(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 401
LDI r1, 116
LDI r2, 108
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 137
LDI r7, 40
LDI r8, 51
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 74
LDI r12, 27
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
