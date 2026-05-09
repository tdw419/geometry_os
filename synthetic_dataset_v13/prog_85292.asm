; DESCRIPTION: Composite: Sets a single white pixel at (326, 90) then Places a blue circle of radius 52 at center (226, 83) then Draws a blue line from (73, 53) to (409, 237).
; PLAN: r0=326(x), r1=90(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=83(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=73(x1), r11=53(y1), r12=409(x2), r13=237(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 90
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 226
LDI r6, 83
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 73
LDI r11, 53
LDI r12, 409
LDI r13, 237
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
