; DESCRIPTION: Composite: Places a red dot at position (250, 34) then Places a magenta 51x77 rectangle at position (291, 168).
; PLAN: r0=250(x), r1=34(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=168(y), r7=51(width), r8=77(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 34
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 291
LDI r6, 168
LDI r7, 51
LDI r8, 77
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
