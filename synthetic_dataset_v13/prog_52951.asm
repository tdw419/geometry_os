; DESCRIPTION: Composite: Places a magenta line segment connecting (268, 56) to (222, 204) then Places a magenta dot at position (212, 24).
; PLAN: r0=268(x1), r1=56(y1), r2=222(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=212(x), r6=24(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 268
LDI r1, 56
LDI r2, 222
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 24
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
