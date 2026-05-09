; DESCRIPTION: Composite: Draws a magenta line from (37, 206) to (371, 223) then Places a magenta dot at position (139, 25).
; PLAN: r0=37(x1), r1=206(y1), r2=371(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=25(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 37
LDI r1, 206
LDI r2, 371
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 25
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
