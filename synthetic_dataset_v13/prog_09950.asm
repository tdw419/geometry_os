; DESCRIPTION: Composite: Places a green 56x85 rectangle at position (267, 24) then Sets a single magenta pixel at (321, 89).
; PLAN: r0=267(x), r1=24(y), r2=56(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x), r6=89(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 267
LDI r1, 24
LDI r2, 56
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 89
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
