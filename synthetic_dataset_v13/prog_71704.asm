; DESCRIPTION: Composite: Places a red line segment connecting (425, 12) to (177, 147) then Places a green dot at position (131, 74).
; PLAN: r0=425(x1), r1=12(y1), r2=177(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=74(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 425
LDI r1, 12
LDI r2, 177
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 74
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
