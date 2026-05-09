; DESCRIPTION: Composite: Places a magenta dot at position (481, 147) then Places a green 51x96 rectangle at position (107, 145).
; PLAN: r0=481(x), r1=147(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=145(y), r7=51(width), r8=96(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 481
LDI r1, 147
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 145
LDI r7, 51
LDI r8, 96
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
