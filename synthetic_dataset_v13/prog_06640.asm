; DESCRIPTION: Composite: Places a white line segment connecting (286, 92) to (157, 55) then Places a yellow dot at position (181, 8).
; PLAN: r0=286(x1), r1=92(y1), r2=157(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=8(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 92
LDI r2, 157
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 8
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
