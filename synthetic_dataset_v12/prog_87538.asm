; DESCRIPTION: Composite: Draws a cyan line from (391, 177) to (282, 16) then Places a magenta dot at position (134, 81).
; PLAN: r0=391(x1), r1=177(y1), r2=282(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=81(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 391
LDI r1, 177
LDI r2, 282
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 81
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
