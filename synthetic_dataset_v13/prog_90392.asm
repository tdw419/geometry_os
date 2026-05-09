; DESCRIPTION: Composite: Draws a blue rectangle at (307, 137) with width 84 and height 16 then Places a green dot at position (426, 220).
; PLAN: r0=307(x), r1=137(y), r2=84(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x), r6=220(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 307
LDI r1, 137
LDI r2, 84
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 220
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
