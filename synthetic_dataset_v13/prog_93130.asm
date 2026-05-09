; DESCRIPTION: Composite: Places a black circle of radius 46 at center (392, 177) then Sets a single white pixel at (481, 11) then Places a white line segment connecting (484, 176) to (283, 240).
; PLAN: r0=392(x), r1=177(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x), r6=11(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=484(x1), r11=176(y1), r12=283(x2), r13=240(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 177
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 11
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 484
LDI r11, 176
LDI r12, 283
LDI r13, 240
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
