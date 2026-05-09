; DESCRIPTION: Composite: Sets a single white pixel at (445, 163) then Renders a blue box of size 77x117 starting at (304, 78).
; PLAN: r0=445(x), r1=163(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=304(x), r6=78(y), r7=77(width), r8=117(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 445
LDI r1, 163
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 304
LDI r6, 78
LDI r7, 77
LDI r8, 117
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
