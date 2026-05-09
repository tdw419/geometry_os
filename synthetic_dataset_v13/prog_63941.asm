; DESCRIPTION: Composite: Places a blue dot at position (85, 10) then Places a white circle of radius 40 at center (48, 94).
; PLAN: r0=85(x), r1=10(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=48(x), r6=94(y), r7=40(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 85
LDI r1, 10
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 48
LDI r6, 94
LDI r7, 40
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
