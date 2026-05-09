; DESCRIPTION: Composite: Places a cyan 64x86 rectangle at position (51, 95) then Places a black circle of radius 36 at center (286, 165) then Sets a single magenta pixel at (172, 204).
; PLAN: r0=51(x), r1=95(y), r2=64(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=165(y), r7=36(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x), r11=204(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 51
LDI r1, 95
LDI r2, 64
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 165
LDI r7, 36
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 204
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
