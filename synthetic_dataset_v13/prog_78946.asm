; DESCRIPTION: Composite: Places a blue circle of radius 11 at center (280, 219) then Places a yellow 86x29 rectangle at position (241, 74) then Places a yellow dot at position (486, 1).
; PLAN: r0=280(x), r1=219(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=74(y), r7=86(width), r8=29(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=486(x), r11=1(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 280
LDI r1, 219
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 74
LDI r7, 86
LDI r8, 29
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 486
LDI r11, 1
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
