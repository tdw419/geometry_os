; DESCRIPTION: Composite: Renders a cyan line between points (510, 212) and (131, 134) then Places a red dot at position (190, 158).
; PLAN: r0=510(x1), r1=212(y1), r2=131(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=158(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 510
LDI r1, 212
LDI r2, 131
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 158
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
