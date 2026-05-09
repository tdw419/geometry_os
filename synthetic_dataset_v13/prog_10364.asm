; DESCRIPTION: Composite: Draws a yellow line from (343, 157) to (3, 215) then Places a magenta dot at position (284, 203).
; PLAN: r0=343(x1), r1=157(y1), r2=3(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=203(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 343
LDI r1, 157
LDI r2, 3
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 203
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
