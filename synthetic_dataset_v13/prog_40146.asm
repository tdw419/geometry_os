; DESCRIPTION: Composite: Places a black line segment connecting (8, 159) to (380, 30) then Places a magenta dot at position (103, 139).
; PLAN: r0=8(x1), r1=159(y1), r2=380(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=139(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 8
LDI r1, 159
LDI r2, 380
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 139
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
