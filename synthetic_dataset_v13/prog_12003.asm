; DESCRIPTION: Composite: Sets a single blue pixel at (229, 53) then Renders a blue box of size 56x29 starting at (386, 71).
; PLAN: r0=229(x), r1=53(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=71(y), r7=56(width), r8=29(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 53
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 386
LDI r6, 71
LDI r7, 56
LDI r8, 29
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
