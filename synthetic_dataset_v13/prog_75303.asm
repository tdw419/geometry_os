; DESCRIPTION: Composite: Places a purple dot at position (154, 238) then Places a blue line segment connecting (343, 242) to (207, 192).
; PLAN: r0=154(x), r1=238(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=343(x1), r6=242(y1), r7=207(x2), r8=192(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 238
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 343
LDI r6, 242
LDI r7, 207
LDI r8, 192
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
