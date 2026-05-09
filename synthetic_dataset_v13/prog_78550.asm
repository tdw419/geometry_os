; DESCRIPTION: Composite: Places a yellow line segment connecting (398, 14) to (359, 225) then Places a yellow circle of radius 36 at center (395, 215) then Renders a white box of size 101x81 starting at (182, 166).
; PLAN: r0=398(x1), r1=14(y1), r2=359(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=215(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=182(x), r11=166(y), r12=101(width), r13=81(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 14
LDI r2, 359
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 215
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 182
LDI r11, 166
LDI r12, 101
LDI r13, 81
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
