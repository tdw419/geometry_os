; DESCRIPTION: Composite: Places a magenta line segment connecting (397, 202) to (214, 89) then Places a white circle of radius 30 at center (415, 188) then Sets a single orange pixel at (53, 148).
; PLAN: r0=397(x1), r1=202(y1), r2=214(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=188(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=53(x), r11=148(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 397
LDI r1, 202
LDI r2, 214
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 188
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 53
LDI r11, 148
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
