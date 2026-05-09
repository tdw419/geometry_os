; DESCRIPTION: Composite: Places a purple dot at position (340, 139) then Places a white 118x10 rectangle at position (140, 218).
; PLAN: r0=340(x), r1=139(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=218(y), r7=118(width), r8=10(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 139
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 218
LDI r7, 118
LDI r8, 10
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
