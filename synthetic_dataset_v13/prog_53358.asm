; DESCRIPTION: Composite: Places a cyan 80x101 rectangle at position (240, 12) then Sets a single blue pixel at (272, 239).
; PLAN: r0=240(x), r1=12(y), r2=80(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=239(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 240
LDI r1, 12
LDI r2, 80
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 239
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
