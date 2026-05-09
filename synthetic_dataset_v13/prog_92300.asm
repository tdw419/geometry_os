; DESCRIPTION: Composite: Places a blue 94x81 rectangle at position (19, 147) then Places a cyan dot at position (455, 11).
; PLAN: r0=19(x), r1=147(y), r2=94(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x), r6=11(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 19
LDI r1, 147
LDI r2, 94
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 11
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
