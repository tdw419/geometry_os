; DESCRIPTION: Composite: Places a blue 111x103 rectangle at position (165, 87) then Sets a single yellow pixel at (193, 168).
; PLAN: r0=165(x), r1=87(y), r2=111(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x), r6=168(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 87
LDI r2, 111
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 168
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
