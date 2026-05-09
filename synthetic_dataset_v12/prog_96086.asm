; DESCRIPTION: Composite: Places a red dot at position (475, 100) then Places a yellow 116x37 rectangle at position (61, 140).
; PLAN: r0=475(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=61(x), r6=140(y), r7=116(width), r8=37(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 100
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 61
LDI r6, 140
LDI r7, 116
LDI r8, 37
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
