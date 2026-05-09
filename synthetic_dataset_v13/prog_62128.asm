; DESCRIPTION: Composite: Sets a single white pixel at (439, 124) then Renders a yellow box of size 21x112 starting at (462, 102).
; PLAN: r0=439(x), r1=124(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=462(x), r6=102(y), r7=21(width), r8=112(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 124
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 462
LDI r6, 102
LDI r7, 21
LDI r8, 112
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
