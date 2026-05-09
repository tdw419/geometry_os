; DESCRIPTION: Composite: Creates a blue rectangular region at (100, 81) spanning 32 by 47 pixels then Sets a single magenta pixel at (200, 42) then Places a blue circle of radius 36 at center (109, 181).
; PLAN: r0=100(x), r1=81(y), r2=32(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x), r6=42(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=109(x), r11=181(y), r12=36(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 100
LDI r1, 81
LDI r2, 32
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 42
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 109
LDI r11, 181
LDI r12, 36
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
