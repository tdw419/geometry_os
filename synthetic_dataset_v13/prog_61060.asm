; DESCRIPTION: Composite: Places a purple 63x92 rectangle at position (367, 125) then Sets a single black pixel at (387, 139).
; PLAN: r0=367(x), r1=125(y), r2=63(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=139(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 367
LDI r1, 125
LDI r2, 63
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 139
LDI r7, 0x000000
PSET r5, r6, r7
HALT
