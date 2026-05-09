; DESCRIPTION: Composite: Places a cyan dot at position (383, 120) then Draws a cyan circle centered at (119, 125) with radius 67 then Places a magenta 73x20 rectangle at position (17, 160).
; PLAN: r0=383(x), r1=120(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=119(x), r6=125(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=17(x), r11=160(y), r12=73(width), r13=20(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 120
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 119
LDI r6, 125
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 17
LDI r11, 160
LDI r12, 73
LDI r13, 20
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
