; DESCRIPTION: Composite: Places a red line segment connecting (69, 198) to (436, 187) then Places a white circle of radius 33 at center (141, 200) then Places a magenta dot at position (173, 250).
; PLAN: r0=69(x1), r1=198(y1), r2=436(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=200(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=173(x), r11=250(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 198
LDI r2, 436
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 200
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 173
LDI r11, 250
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
