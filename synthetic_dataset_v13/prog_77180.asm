; DESCRIPTION: Composite: Places a green circle of radius 26 at center (47, 127) then Places a yellow line segment connecting (193, 51) to (469, 220) then Renders a red box of size 43x15 starting at (229, 12).
; PLAN: r0=47(x), r1=127(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x1), r6=51(y1), r7=469(x2), r8=220(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=229(x), r11=12(y), r12=43(width), r13=15(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 127
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 51
LDI r7, 469
LDI r8, 220
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 12
LDI r12, 43
LDI r13, 15
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
