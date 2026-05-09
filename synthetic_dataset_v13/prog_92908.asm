; DESCRIPTION: Composite: Places a black dot at position (460, 240) then Draws a cyan rectangle at (448, 125) with width 11 and height 19 then Draws a blue circle centered at (110, 157) with radius 42.
; PLAN: r0=460(x), r1=240(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=448(x), r6=125(y), r7=11(width), r8=19(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=110(x), r11=157(y), r12=42(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 460
LDI r1, 240
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 448
LDI r6, 125
LDI r7, 11
LDI r8, 19
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 110
LDI r11, 157
LDI r12, 42
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
