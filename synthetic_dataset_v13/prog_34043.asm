; DESCRIPTION: Composite: Places a blue circle of radius 54 at center (273, 62) then Places a black dot at position (229, 208).
; PLAN: r0=273(x), r1=62(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=208(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 62
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 208
LDI r7, 0x000000
PSET r5, r6, r7
HALT
