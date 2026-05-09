; DESCRIPTION: Composite: Places a purple dot at position (30, 168) then Renders a purple box of size 11x115 starting at (498, 44).
; PLAN: r0=30(x), r1=168(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=498(x), r6=44(y), r7=11(width), r8=115(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 168
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 498
LDI r6, 44
LDI r7, 11
LDI r8, 115
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
