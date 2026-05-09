; DESCRIPTION: Composite: Sets a single magenta pixel at (97, 242) then Places a black line segment connecting (242, 142) to (0, 168).
; PLAN: r0=97(x), r1=242(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=242(x1), r6=142(y1), r7=0(x2), r8=168(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 97
LDI r1, 242
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 142
LDI r7, 0
LDI r8, 168
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
