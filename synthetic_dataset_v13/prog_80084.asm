; DESCRIPTION: Composite: Places a red 76x22 rectangle at position (102, 104) then Sets a single magenta pixel at (462, 238).
; PLAN: r0=102(x), r1=104(y), r2=76(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x), r6=238(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 102
LDI r1, 104
LDI r2, 76
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 238
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
