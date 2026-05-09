; DESCRIPTION: Composite: Sets a single magenta pixel at (460, 81) then Places a blue 11x98 rectangle at position (294, 58) then Places a black circle of radius 20 at center (261, 63).
; PLAN: r0=460(x), r1=81(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=294(x), r6=58(y), r7=11(width), r8=98(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=261(x), r11=63(y), r12=20(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 460
LDI r1, 81
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 294
LDI r6, 58
LDI r7, 11
LDI r8, 98
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 63
LDI r12, 20
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
