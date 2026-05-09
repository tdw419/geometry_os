; DESCRIPTION: Composite: Places a green dot at position (229, 82) then Places a black circle of radius 52 at center (460, 84).
; PLAN: r0=229(x), r1=82(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=460(x), r6=84(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 229
LDI r1, 82
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 460
LDI r6, 84
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
