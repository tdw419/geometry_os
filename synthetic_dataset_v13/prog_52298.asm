; DESCRIPTION: Composite: Places a magenta circle of radius 80 at center (241, 152) then Places a magenta dot at position (250, 200).
; PLAN: r0=241(x), r1=152(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=200(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 152
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 200
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
