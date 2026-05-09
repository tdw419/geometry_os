; DESCRIPTION: Composite: Draws a magenta rectangle at (336, 144) with width 48 and height 52 then Places a blue dot at position (428, 245).
; PLAN: r0=336(x), r1=144(y), r2=48(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=428(x), r6=245(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 336
LDI r1, 144
LDI r2, 48
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 245
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
