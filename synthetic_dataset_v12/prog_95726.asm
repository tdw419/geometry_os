; DESCRIPTION: Composite: Places a black circle of radius 74 at center (301, 101) then Places a cyan 63x53 rectangle at position (256, 65) then Sets a single black pixel at (262, 0).
; PLAN: r0=301(x), r1=101(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x), r6=65(y), r7=63(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=262(x), r11=0(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 101
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 65
LDI r7, 63
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 0
LDI r12, 0x000000
PSET r10, r11, r12
HALT
