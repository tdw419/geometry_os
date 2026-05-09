; DESCRIPTION: Composite: Renders a cyan box of size 45x27 starting at (68, 11) then Places a magenta dot at position (147, 47).
; PLAN: r0=68(x), r1=11(y), r2=45(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=147(x), r6=47(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 68
LDI r1, 11
LDI r2, 45
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 47
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
