; DESCRIPTION: Composite: Places a black dot at position (408, 164) then Places a red circle of radius 30 at center (383, 100).
; PLAN: r0=408(x), r1=164(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=100(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 408
LDI r1, 164
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 383
LDI r6, 100
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
