; DESCRIPTION: Composite: Renders a cyan line between points (382, 197) and (473, 179) then Places a white dot at position (45, 81) then Places a black circle of radius 76 at center (405, 116).
; PLAN: r0=382(x1), r1=197(y1), r2=473(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=81(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=405(x), r11=116(y), r12=76(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 382
LDI r1, 197
LDI r2, 473
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 81
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 405
LDI r11, 116
LDI r12, 76
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
