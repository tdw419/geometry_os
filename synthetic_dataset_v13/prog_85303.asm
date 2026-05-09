; DESCRIPTION: Composite: Places a red circle of radius 18 at center (470, 214) then Sets a single white pixel at (269, 65) then Places a purple line segment connecting (510, 236) to (412, 18).
; PLAN: r0=470(x), r1=214(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=65(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=510(x1), r11=236(y1), r12=412(x2), r13=18(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 214
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 65
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 510
LDI r11, 236
LDI r12, 412
LDI r13, 18
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
