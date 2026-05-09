; DESCRIPTION: Composite: Places a red dot at position (173, 216) then Creates a white circular shape at (365, 167) with radius 60.
; PLAN: r0=173(x), r1=216(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=167(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 216
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 365
LDI r6, 167
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
