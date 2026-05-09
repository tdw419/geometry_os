; DESCRIPTION: Composite: Places a blue dot at position (445, 103) then Renders a white disk with center (193, 81) and radius 62.
; PLAN: r0=445(x), r1=103(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=193(x), r6=81(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 445
LDI r1, 103
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 193
LDI r6, 81
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
