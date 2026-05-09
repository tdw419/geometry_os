; DESCRIPTION: Composite: Sets a single magenta pixel at (285, 238) then Places a red circle of radius 79 at center (148, 95) then Renders a black box of size 85x93 starting at (412, 142).
; PLAN: r0=285(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=95(y), r7=79(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=412(x), r11=142(y), r12=85(width), r13=93(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 238
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 95
LDI r7, 79
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 412
LDI r11, 142
LDI r12, 85
LDI r13, 93
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
