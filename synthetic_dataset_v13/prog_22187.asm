; DESCRIPTION: Composite: Places a blue dot at position (166, 167) then Renders a cyan box of size 77x56 starting at (322, 0).
; PLAN: r0=166(x), r1=167(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=0(y), r7=77(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 167
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 0
LDI r7, 77
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
