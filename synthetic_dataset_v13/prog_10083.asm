; DESCRIPTION: Composite: Sets a single magenta pixel at (366, 237) then Renders a cyan line between points (222, 238) and (143, 105).
; PLAN: r0=366(x), r1=237(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=222(x1), r6=238(y1), r7=143(x2), r8=105(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 237
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 222
LDI r6, 238
LDI r7, 143
LDI r8, 105
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
