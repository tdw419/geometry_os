; DESCRIPTION: Composite: Sets a single yellow pixel at (477, 222) then Renders a blue disk with center (285, 135) and radius 37 then Places a white 109x120 rectangle at position (238, 96).
; PLAN: r0=477(x), r1=222(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=135(y), r7=37(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=238(x), r11=96(y), r12=109(width), r13=120(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 222
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 285
LDI r6, 135
LDI r7, 37
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 238
LDI r11, 96
LDI r12, 109
LDI r13, 120
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
