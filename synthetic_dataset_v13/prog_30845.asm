; DESCRIPTION: Composite: Sets a single blue pixel at (309, 98) then Renders a red box of size 73x60 starting at (140, 36).
; PLAN: r0=309(x), r1=98(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=36(y), r7=73(width), r8=60(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 98
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 36
LDI r7, 73
LDI r8, 60
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
