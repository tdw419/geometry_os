; DESCRIPTION: Composite: Sets a single purple pixel at (333, 111) then Places a white circle of radius 36 at center (98, 163) then Draws a black rectangle at (198, 81) with width 28 and height 16.
; PLAN: r0=333(x), r1=111(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=163(y), r7=36(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=198(x), r11=81(y), r12=28(width), r13=16(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 111
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 98
LDI r6, 163
LDI r7, 36
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 198
LDI r11, 81
LDI r12, 28
LDI r13, 16
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
