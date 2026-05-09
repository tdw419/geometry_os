; DESCRIPTION: Composite: Sets a single black pixel at (28, 170) then Renders a cyan box of size 77x48 starting at (1, 100).
; PLAN: r0=28(x), r1=170(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=1(x), r6=100(y), r7=77(width), r8=48(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 170
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 1
LDI r6, 100
LDI r7, 77
LDI r8, 48
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
