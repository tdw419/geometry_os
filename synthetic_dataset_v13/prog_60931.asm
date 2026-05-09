; DESCRIPTION: Composite: Places a black circle of radius 10 at center (415, 141) then Sets a single blue pixel at (383, 5) then Renders a green line between points (69, 227) and (429, 61).
; PLAN: r0=415(x), r1=141(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=5(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=69(x1), r11=227(y1), r12=429(x2), r13=61(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 141
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 5
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 69
LDI r11, 227
LDI r12, 429
LDI r13, 61
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
