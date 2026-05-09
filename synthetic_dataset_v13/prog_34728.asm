; DESCRIPTION: Composite: Places a white dot at position (54, 94) then Places a white circle of radius 50 at center (216, 170).
; PLAN: r0=54(x), r1=94(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=170(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 54
LDI r1, 94
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 216
LDI r6, 170
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
