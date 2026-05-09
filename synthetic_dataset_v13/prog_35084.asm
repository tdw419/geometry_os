; DESCRIPTION: Composite: Sets a single magenta pixel at (159, 98) then Creates a red rectangular region at (400, 134) spanning 87 by 52 pixels.
; PLAN: r0=159(x), r1=98(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=134(y), r7=87(width), r8=52(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 98
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 400
LDI r6, 134
LDI r7, 87
LDI r8, 52
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
