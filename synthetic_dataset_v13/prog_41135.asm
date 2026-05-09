; DESCRIPTION: Composite: Sets a single cyan pixel at (413, 164) then Places a white circle of radius 28 at center (73, 193) then Places a purple 70x110 rectangle at position (232, 141).
; PLAN: r0=413(x), r1=164(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=193(y), r7=28(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=232(x), r11=141(y), r12=70(width), r13=110(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 164
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 193
LDI r7, 28
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 232
LDI r11, 141
LDI r12, 70
LDI r13, 110
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
