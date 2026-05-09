; DESCRIPTION: Composite: Renders a cyan line between points (316, 56) and (212, 205) then Places a magenta dot at position (232, 30).
; PLAN: r0=316(x1), r1=56(y1), r2=212(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=30(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 316
LDI r1, 56
LDI r2, 212
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 30
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
