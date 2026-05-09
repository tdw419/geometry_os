; DESCRIPTION: Composite: Sets a single yellow pixel at (418, 122) then Renders a purple box of size 38x51 starting at (4, 124).
; PLAN: r0=418(x), r1=122(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=4(x), r6=124(y), r7=38(width), r8=51(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 122
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 4
LDI r6, 124
LDI r7, 38
LDI r8, 51
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
