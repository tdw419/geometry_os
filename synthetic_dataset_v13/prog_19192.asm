; DESCRIPTION: Composite: Draws a cyan line from (101, 189) to (246, 206) then Places a magenta dot at position (49, 251).
; PLAN: r0=101(x1), r1=189(y1), r2=246(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=251(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 101
LDI r1, 189
LDI r2, 246
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 251
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
