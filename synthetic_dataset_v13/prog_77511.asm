; DESCRIPTION: Composite: Renders a magenta disk with center (346, 83) and radius 75 then Places a black dot at position (352, 237).
; PLAN: r0=346(x), r1=83(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=237(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 346
LDI r1, 83
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 237
LDI r7, 0x000000
PSET r5, r6, r7
HALT
