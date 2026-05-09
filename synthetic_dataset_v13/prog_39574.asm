; DESCRIPTION: Composite: Renders a cyan box of size 52x104 starting at (323, 107) then Sets a single magenta pixel at (402, 63).
; PLAN: r0=323(x), r1=107(y), r2=52(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=63(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 323
LDI r1, 107
LDI r2, 52
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 63
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
