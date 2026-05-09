; DESCRIPTION: Composite: Sets a single black pixel at (240, 64) then Renders a white box of size 93x83 starting at (145, 62).
; PLAN: r0=240(x), r1=64(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=62(y), r7=93(width), r8=83(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 64
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 145
LDI r6, 62
LDI r7, 93
LDI r8, 83
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
