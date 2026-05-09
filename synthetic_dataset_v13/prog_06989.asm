; DESCRIPTION: Composite: Draws a yellow circle centered at (239, 131) with radius 46 then Places a black 51x72 rectangle at position (221, 114).
; PLAN: r0=239(x), r1=131(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x), r6=114(y), r7=51(width), r8=72(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 131
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 114
LDI r7, 51
LDI r8, 72
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
