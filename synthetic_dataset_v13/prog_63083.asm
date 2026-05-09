; DESCRIPTION: Composite: Sets a single green pixel at (199, 246) then Renders a blue box of size 92x37 starting at (12, 182).
; PLAN: r0=199(x), r1=246(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=12(x), r6=182(y), r7=92(width), r8=37(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 246
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 12
LDI r6, 182
LDI r7, 92
LDI r8, 37
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
