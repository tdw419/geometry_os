; DESCRIPTION: Composite: Renders a magenta line between points (376, 95) and (333, 156) then Places a yellow dot at position (73, 38).
; PLAN: r0=376(x1), r1=95(y1), r2=333(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=38(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 376
LDI r1, 95
LDI r2, 333
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 38
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
