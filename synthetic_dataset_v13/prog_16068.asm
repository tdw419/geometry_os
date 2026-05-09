; DESCRIPTION: Composite: Sets a single white pixel at (419, 127) then Places a green circle of radius 57 at center (371, 99) then Draws a black line from (64, 133) to (115, 60).
; PLAN: r0=419(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=99(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=64(x1), r11=133(y1), r12=115(x2), r13=60(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 127
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 371
LDI r6, 99
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 64
LDI r11, 133
LDI r12, 115
LDI r13, 60
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
