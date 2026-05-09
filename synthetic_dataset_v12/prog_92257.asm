; DESCRIPTION: Composite: Places a purple 88x51 rectangle at position (214, 129) then Creates a purple circular shape at (127, 79) with radius 57.
; PLAN: r0=214(x), r1=129(y), r2=88(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=79(y), r7=57(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 214
LDI r1, 129
LDI r2, 88
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 79
LDI r7, 57
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
