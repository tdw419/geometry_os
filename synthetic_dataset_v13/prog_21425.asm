; DESCRIPTION: Composite: Places a magenta dot at position (478, 23) then Renders a green box of size 75x102 starting at (151, 0).
; PLAN: r0=478(x), r1=23(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=151(x), r6=0(y), r7=75(width), r8=102(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 478
LDI r1, 23
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 151
LDI r6, 0
LDI r7, 75
LDI r8, 102
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
