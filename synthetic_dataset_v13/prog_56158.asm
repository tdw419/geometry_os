; DESCRIPTION: Composite: Places a blue 50x103 rectangle at position (417, 97) then Sets a single magenta pixel at (382, 168).
; PLAN: r0=417(x), r1=97(y), r2=50(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x), r6=168(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 417
LDI r1, 97
LDI r2, 50
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 168
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
