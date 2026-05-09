; DESCRIPTION: Composite: Places a cyan 98x27 rectangle at position (30, 112) then Sets a single purple pixel at (228, 114).
; PLAN: r0=30(x), r1=112(y), r2=98(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x), r6=114(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 30
LDI r1, 112
LDI r2, 98
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 114
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
