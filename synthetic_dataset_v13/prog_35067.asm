; DESCRIPTION: Composite: Sets a single magenta pixel at (80, 126) then Renders a red box of size 71x15 starting at (312, 211).
; PLAN: r0=80(x), r1=126(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=211(y), r7=71(width), r8=15(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 126
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 211
LDI r7, 71
LDI r8, 15
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
