; DESCRIPTION: Composite: Places a blue 10x82 rectangle at position (448, 64) then Sets a single cyan pixel at (499, 150).
; PLAN: r0=448(x), r1=64(y), r2=10(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=499(x), r6=150(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 448
LDI r1, 64
LDI r2, 10
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 150
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
