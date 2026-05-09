; DESCRIPTION: Composite: Places a red dot at position (297, 61) then Places a white circle of radius 59 at center (413, 196).
; PLAN: r0=297(x), r1=61(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=196(y), r7=59(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 297
LDI r1, 61
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 413
LDI r6, 196
LDI r7, 59
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
