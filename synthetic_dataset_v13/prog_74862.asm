; DESCRIPTION: Composite: Sets a single orange pixel at (116, 13) then Renders a yellow line between points (327, 230) and (494, 131).
; PLAN: r0=116(x), r1=13(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=327(x1), r6=230(y1), r7=494(x2), r8=131(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 13
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 327
LDI r6, 230
LDI r7, 494
LDI r8, 131
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
