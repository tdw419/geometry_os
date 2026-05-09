; DESCRIPTION: Composite: Draws a magenta line from (277, 151) to (467, 193) then Places a yellow dot at position (501, 8).
; PLAN: r0=277(x1), r1=151(y1), r2=467(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=501(x), r6=8(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 277
LDI r1, 151
LDI r2, 467
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 8
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
