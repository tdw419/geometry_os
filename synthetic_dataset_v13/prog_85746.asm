; DESCRIPTION: Composite: Sets a single red pixel at (476, 200) then Places a black 110x11 rectangle at position (336, 38) then Places a blue circle of radius 64 at center (433, 161).
; PLAN: r0=476(x), r1=200(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=38(y), r7=110(width), r8=11(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=433(x), r11=161(y), r12=64(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 476
LDI r1, 200
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 336
LDI r6, 38
LDI r7, 110
LDI r8, 11
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 161
LDI r12, 64
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
