; DESCRIPTION: Composite: Places a blue circle of radius 31 at center (36, 39) then Draws a purple rectangle at (67, 222) with width 48 and height 10 then Sets a single orange pixel at (422, 66).
; PLAN: r0=36(x), r1=39(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=67(x), r6=222(y), r7=48(width), r8=10(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x), r11=66(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 36
LDI r1, 39
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 67
LDI r6, 222
LDI r7, 48
LDI r8, 10
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 66
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
