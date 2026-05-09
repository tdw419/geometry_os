; DESCRIPTION: Composite: Places a yellow 14x79 rectangle at position (111, 88) then Places a cyan circle of radius 19 at center (340, 159) then Sets a single blue pixel at (4, 36).
; PLAN: r0=111(x), r1=88(y), r2=14(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x), r6=159(y), r7=19(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x), r11=36(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 111
LDI r1, 88
LDI r2, 14
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 159
LDI r7, 19
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 36
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
