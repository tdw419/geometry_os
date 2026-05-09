; DESCRIPTION: Composite: Draws a green line from (284, 228) to (268, 182) then Places a purple dot at position (159, 153).
; PLAN: r0=284(x1), r1=228(y1), r2=268(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=153(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 284
LDI r1, 228
LDI r2, 268
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 153
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
