; DESCRIPTION: Composite: Places a white circle of radius 36 at center (372, 146) then Sets a single black pixel at (379, 243) then Renders a blue box of size 64x69 starting at (82, 60).
; PLAN: r0=372(x), r1=146(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=243(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=82(x), r11=60(y), r12=64(width), r13=69(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 372
LDI r1, 146
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 243
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 82
LDI r11, 60
LDI r12, 64
LDI r13, 69
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
