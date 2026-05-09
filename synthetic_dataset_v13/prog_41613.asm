; DESCRIPTION: Composite: Sets a single yellow pixel at (122, 190) then Renders a purple box of size 116x66 starting at (264, 42).
; PLAN: r0=122(x), r1=190(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=42(y), r7=116(width), r8=66(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 122
LDI r1, 190
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 264
LDI r6, 42
LDI r7, 116
LDI r8, 66
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
