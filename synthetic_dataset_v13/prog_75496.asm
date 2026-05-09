; DESCRIPTION: Composite: Places a blue 94x18 rectangle at position (75, 86) then Sets a single orange pixel at (405, 240).
; PLAN: r0=75(x), r1=86(y), r2=94(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=240(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 86
LDI r2, 94
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 240
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
