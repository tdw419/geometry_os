; DESCRIPTION: Composite: Places a black 57x51 rectangle at position (241, 51) then Places a magenta circle of radius 40 at center (79, 210) then Sets a single purple pixel at (357, 43).
; PLAN: r0=241(x), r1=51(y), r2=57(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=210(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=357(x), r11=43(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 241
LDI r1, 51
LDI r2, 57
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 210
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 357
LDI r11, 43
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
