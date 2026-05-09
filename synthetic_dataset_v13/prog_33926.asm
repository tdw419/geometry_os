; DESCRIPTION: Composite: Places a magenta dot at position (138, 210) then Renders a black box of size 11x42 starting at (63, 151).
; PLAN: r0=138(x), r1=210(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=151(y), r7=11(width), r8=42(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 210
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 63
LDI r6, 151
LDI r7, 11
LDI r8, 42
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
