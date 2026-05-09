; DESCRIPTION: Composite: Places a blue dot at position (480, 172) then Draws a cyan rectangle at (448, 160) with width 17 and height 60.
; PLAN: r0=480(x), r1=172(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=448(x), r6=160(y), r7=17(width), r8=60(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 480
LDI r1, 172
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 448
LDI r6, 160
LDI r7, 17
LDI r8, 60
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
