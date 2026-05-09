; DESCRIPTION: Composite: Places a red dot at position (334, 40) then Places a magenta 93x34 rectangle at position (349, 20).
; PLAN: r0=334(x), r1=40(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=349(x), r6=20(y), r7=93(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 40
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 349
LDI r6, 20
LDI r7, 93
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
