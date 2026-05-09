; DESCRIPTION: Composite: Places a green dot at position (327, 72) then Draws a black circle centered at (356, 131) with radius 28.
; PLAN: r0=327(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=131(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 327
LDI r1, 72
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 356
LDI r6, 131
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
