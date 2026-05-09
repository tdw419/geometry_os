; DESCRIPTION: Composite: Draws a purple circle centered at (341, 159) with radius 76 then Places a red dot at position (139, 7) then Renders a cyan line between points (218, 182) and (488, 19).
; PLAN: r0=341(x), r1=159(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=7(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=218(x1), r11=182(y1), r12=488(x2), r13=19(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 159
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 7
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 218
LDI r11, 182
LDI r12, 488
LDI r13, 19
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
