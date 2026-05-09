; DESCRIPTION: Composite: Places a red dot at position (398, 137) then Draws a black circle centered at (29, 103) with radius 19.
; PLAN: r0=398(x), r1=137(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=29(x), r6=103(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 398
LDI r1, 137
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 29
LDI r6, 103
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
