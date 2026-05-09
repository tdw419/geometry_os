; DESCRIPTION: Composite: Places a cyan 115x51 rectangle at position (64, 121) then Creates a blue circular shape at (100, 77) with radius 12 then Sets a single magenta pixel at (431, 7).
; PLAN: r0=64(x), r1=121(y), r2=115(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=77(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=431(x), r11=7(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 64
LDI r1, 121
LDI r2, 115
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 77
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 431
LDI r11, 7
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
