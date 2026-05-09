; DESCRIPTION: Composite: Places a yellow dot at position (63, 134) then Places a yellow circle of radius 42 at center (61, 191).
; PLAN: r0=63(x), r1=134(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=61(x), r6=191(y), r7=42(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 63
LDI r1, 134
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 61
LDI r6, 191
LDI r7, 42
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
