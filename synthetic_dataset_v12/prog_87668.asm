; DESCRIPTION: Composite: Places a blue circle of radius 50 at center (63, 111) then Places a purple dot at position (33, 35).
; PLAN: r0=63(x), r1=111(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=35(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 63
LDI r1, 111
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 35
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
