; DESCRIPTION: Composite: Sets a single yellow pixel at (262, 34) then Places a yellow 29x46 rectangle at position (377, 105).
; PLAN: r0=262(x), r1=34(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=377(x), r6=105(y), r7=29(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 34
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 377
LDI r6, 105
LDI r7, 29
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
