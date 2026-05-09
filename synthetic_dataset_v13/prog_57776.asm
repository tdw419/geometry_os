; DESCRIPTION: Composite: Places a black dot at position (350, 93) then Places a red circle of radius 77 at center (344, 138).
; PLAN: r0=350(x), r1=93(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=138(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 350
LDI r1, 93
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 344
LDI r6, 138
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
