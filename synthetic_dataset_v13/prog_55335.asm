; DESCRIPTION: Composite: Draws a blue circle centered at (200, 197) with radius 10 then Places a cyan 36x96 rectangle at position (239, 89) then Sets a single magenta pixel at (129, 95).
; PLAN: r0=200(x), r1=197(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x), r6=89(y), r7=36(width), r8=96(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=129(x), r11=95(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 197
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 89
LDI r7, 36
LDI r8, 96
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 95
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
