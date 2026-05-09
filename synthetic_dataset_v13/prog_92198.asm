; DESCRIPTION: Composite: Places a purple 48x45 rectangle at position (48, 25) then Sets a single red pixel at (494, 98).
; PLAN: r0=48(x), r1=25(y), r2=48(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x), r6=98(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 48
LDI r1, 25
LDI r2, 48
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 98
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
