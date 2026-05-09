; DESCRIPTION: Composite: Sets a single blue pixel at (115, 8) then Renders a white box of size 45x19 starting at (112, 160).
; PLAN: r0=115(x), r1=8(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=160(y), r7=45(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 8
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 112
LDI r6, 160
LDI r7, 45
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
