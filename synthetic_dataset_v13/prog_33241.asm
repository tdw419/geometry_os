; DESCRIPTION: Composite: Places a blue circle of radius 40 at center (426, 128) then Places a white dot at position (470, 112).
; PLAN: r0=426(x), r1=128(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=470(x), r6=112(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 128
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 470
LDI r6, 112
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
