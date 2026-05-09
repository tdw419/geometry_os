; DESCRIPTION: Composite: Places a purple 27x59 rectangle at position (377, 159) then Creates a red circular shape at (119, 44) with radius 38 then Places a black dot at position (314, 17).
; PLAN: r0=377(x), r1=159(y), r2=27(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x), r6=44(y), r7=38(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x), r11=17(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 377
LDI r1, 159
LDI r2, 27
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 44
LDI r7, 38
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 17
LDI r12, 0x000000
PSET r10, r11, r12
HALT
