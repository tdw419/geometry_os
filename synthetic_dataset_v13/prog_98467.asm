; DESCRIPTION: Composite: Places a yellow circle of radius 55 at center (195, 182) then Sets a single magenta pixel at (317, 86) then Places a cyan 120x114 rectangle at position (348, 79).
; PLAN: r0=195(x), r1=182(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x), r6=86(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=348(x), r11=79(y), r12=120(width), r13=114(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 182
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 86
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 348
LDI r11, 79
LDI r12, 120
LDI r13, 114
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
