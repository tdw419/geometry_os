; DESCRIPTION: Composite: Places a purple dot at position (106, 237) then Places a blue circle of radius 37 at center (209, 65).
; PLAN: r0=106(x), r1=237(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=65(y), r7=37(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 106
LDI r1, 237
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 65
LDI r7, 37
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
