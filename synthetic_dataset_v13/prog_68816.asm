; DESCRIPTION: Composite: Sets a single blue pixel at (220, 119) then Renders a magenta box of size 51x95 starting at (168, 9).
; PLAN: r0=220(x), r1=119(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=9(y), r7=51(width), r8=95(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 119
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 168
LDI r6, 9
LDI r7, 51
LDI r8, 95
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
