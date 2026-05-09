; DESCRIPTION: Composite: Places a blue 44x48 rectangle at position (419, 82) then Sets a single green pixel at (293, 157).
; PLAN: r0=419(x), r1=82(y), r2=44(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x), r6=157(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 419
LDI r1, 82
LDI r2, 44
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 157
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
