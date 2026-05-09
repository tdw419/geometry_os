; DESCRIPTION: Composite: Places a green 120x41 rectangle at position (380, 156) then Sets a single magenta pixel at (47, 104).
; PLAN: r0=380(x), r1=156(y), r2=120(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=47(x), r6=104(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 380
LDI r1, 156
LDI r2, 120
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 104
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
