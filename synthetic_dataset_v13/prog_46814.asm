; DESCRIPTION: Composite: Sets a single white pixel at (226, 48) then Places a black line segment connecting (462, 165) to (455, 158).
; PLAN: r0=226(x), r1=48(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=462(x1), r6=165(y1), r7=455(x2), r8=158(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 48
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 462
LDI r6, 165
LDI r7, 455
LDI r8, 158
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
