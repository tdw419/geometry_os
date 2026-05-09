; DESCRIPTION: Composite: Places a purple dot at position (478, 77) then Places a white 68x75 rectangle at position (402, 23).
; PLAN: r0=478(x), r1=77(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=402(x), r6=23(y), r7=68(width), r8=75(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 478
LDI r1, 77
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 402
LDI r6, 23
LDI r7, 68
LDI r8, 75
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
