; DESCRIPTION: Composite: Places a white dot at position (246, 92) then Renders a black line between points (148, 237) and (448, 108).
; PLAN: r0=246(x), r1=92(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=148(x1), r6=237(y1), r7=448(x2), r8=108(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 92
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 237
LDI r7, 448
LDI r8, 108
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
