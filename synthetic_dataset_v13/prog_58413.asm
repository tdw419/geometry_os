; DESCRIPTION: Composite: Places a black dot at position (80, 45) then Places a red circle of radius 80 at center (344, 92).
; PLAN: r0=80(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=92(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 45
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 344
LDI r6, 92
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
