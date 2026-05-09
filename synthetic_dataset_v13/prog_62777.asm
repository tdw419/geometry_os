; DESCRIPTION: Composite: Renders a cyan line between points (50, 14) and (461, 61) then Places a magenta dot at position (84, 229).
; PLAN: r0=50(x1), r1=14(y1), r2=461(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=229(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 50
LDI r1, 14
LDI r2, 461
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 229
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
