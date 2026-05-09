; DESCRIPTION: Composite: Places a cyan circle of radius 42 at center (400, 125) then Places a blue dot at position (73, 22).
; PLAN: r0=400(x), r1=125(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=22(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 400
LDI r1, 125
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 22
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
