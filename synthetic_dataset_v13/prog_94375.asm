; DESCRIPTION: Composite: Places a blue 54x27 rectangle at position (452, 107) then Sets a single magenta pixel at (382, 3).
; PLAN: r0=452(x), r1=107(y), r2=54(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x), r6=3(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 452
LDI r1, 107
LDI r2, 54
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 3
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
