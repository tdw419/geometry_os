; DESCRIPTION: Composite: Renders a blue box of size 63x58 starting at (447, 35) then Sets a single white pixel at (123, 121).
; PLAN: r0=447(x), r1=35(y), r2=63(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=121(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 447
LDI r1, 35
LDI r2, 63
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 121
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
