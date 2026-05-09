; DESCRIPTION: Composite: Places a magenta dot at position (477, 89) then Places a blue 32x27 rectangle at position (153, 196).
; PLAN: r0=477(x), r1=89(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=196(y), r7=32(width), r8=27(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 89
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 153
LDI r6, 196
LDI r7, 32
LDI r8, 27
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
