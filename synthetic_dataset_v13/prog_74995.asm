; DESCRIPTION: Composite: Sets a single white pixel at (101, 40) then Renders a blue box of size 23x45 starting at (31, 100).
; PLAN: r0=101(x), r1=40(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=31(x), r6=100(y), r7=23(width), r8=45(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 40
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 31
LDI r6, 100
LDI r7, 23
LDI r8, 45
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
