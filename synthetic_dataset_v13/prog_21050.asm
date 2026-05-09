; DESCRIPTION: Composite: Sets a single blue pixel at (70, 154) then Renders a white box of size 45x72 starting at (396, 130).
; PLAN: r0=70(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=396(x), r6=130(y), r7=45(width), r8=72(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 396
LDI r6, 130
LDI r7, 45
LDI r8, 72
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
