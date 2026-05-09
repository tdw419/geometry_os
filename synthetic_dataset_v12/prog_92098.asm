; DESCRIPTION: Composite: Sets a single black pixel at (382, 142) then Places a white line segment connecting (118, 125) to (333, 163).
; PLAN: r0=382(x), r1=142(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=118(x1), r6=125(y1), r7=333(x2), r8=163(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 142
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 118
LDI r6, 125
LDI r7, 333
LDI r8, 163
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
