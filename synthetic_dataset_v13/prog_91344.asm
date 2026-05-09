; DESCRIPTION: Composite: Sets a single white pixel at (299, 174) then Renders a purple box of size 42x102 starting at (311, 76).
; PLAN: r0=299(x), r1=174(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=76(y), r7=42(width), r8=102(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 174
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 311
LDI r6, 76
LDI r7, 42
LDI r8, 102
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
