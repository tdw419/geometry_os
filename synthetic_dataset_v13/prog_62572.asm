; DESCRIPTION: Composite: Renders a magenta line between points (273, 156) and (434, 163) then Places a magenta dot at position (287, 32).
; PLAN: r0=273(x1), r1=156(y1), r2=434(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=32(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 156
LDI r2, 434
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 32
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
