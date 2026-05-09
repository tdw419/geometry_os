; DESCRIPTION: Composite: Places a green line segment connecting (10, 92) to (64, 116) then Places a yellow dot at position (119, 98).
; PLAN: r0=10(x1), r1=92(y1), r2=64(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=98(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 10
LDI r1, 92
LDI r2, 64
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 98
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
