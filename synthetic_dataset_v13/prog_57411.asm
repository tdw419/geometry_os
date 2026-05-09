; DESCRIPTION: Composite: Places a green dot at position (90, 51) then Places a orange circle of radius 12 at center (148, 57).
; PLAN: r0=90(x), r1=51(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=57(y), r7=12(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 90
LDI r1, 51
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 148
LDI r6, 57
LDI r7, 12
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
