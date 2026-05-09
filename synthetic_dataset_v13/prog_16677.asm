; DESCRIPTION: Composite: Renders a blue disk with center (220, 160) and radius 54 then Sets a single white pixel at (332, 198) then Places a red line segment connecting (128, 207) to (220, 162).
; PLAN: r0=220(x), r1=160(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x), r6=198(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=128(x1), r11=207(y1), r12=220(x2), r13=162(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 160
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 198
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 128
LDI r11, 207
LDI r12, 220
LDI r13, 162
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
