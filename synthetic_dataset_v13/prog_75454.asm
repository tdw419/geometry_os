; DESCRIPTION: Composite: Draws a magenta line from (454, 233) to (3, 26) then Places a magenta dot at position (61, 21).
; PLAN: r0=454(x1), r1=233(y1), r2=3(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=21(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 454
LDI r1, 233
LDI r2, 3
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 21
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
