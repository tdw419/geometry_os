; DESCRIPTION: Composite: Places a black dot at position (184, 212) then Places a yellow circle of radius 71 at center (432, 152).
; PLAN: r0=184(x), r1=212(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=152(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 184
LDI r1, 212
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 432
LDI r6, 152
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
