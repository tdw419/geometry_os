; DESCRIPTION: Composite: Creates a white circular shape at (448, 205) with radius 10 then Draws a purple rectangle at (75, 173) with width 54 and height 63 then Places a cyan dot at position (6, 24).
; PLAN: r0=448(x), r1=205(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=173(y), r7=54(width), r8=63(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=6(x), r11=24(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 448
LDI r1, 205
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 173
LDI r7, 54
LDI r8, 63
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 6
LDI r11, 24
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
