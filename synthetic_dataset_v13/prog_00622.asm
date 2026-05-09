; DESCRIPTION: Composite: Draws a cyan line from (100, 211) to (72, 195) then Places a yellow dot at position (246, 44).
; PLAN: r0=100(x1), r1=211(y1), r2=72(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=44(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 211
LDI r2, 72
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 44
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
