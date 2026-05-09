; DESCRIPTION: Composite: Places a black line segment connecting (435, 176) to (439, 34) then Sets a single white pixel at (138, 211) then Draws a red circle centered at (161, 64) with radius 28.
; PLAN: r0=435(x1), r1=176(y1), r2=439(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=211(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=161(x), r11=64(y), r12=28(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 435
LDI r1, 176
LDI r2, 439
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 211
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 161
LDI r11, 64
LDI r12, 28
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
