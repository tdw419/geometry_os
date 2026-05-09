; DESCRIPTION: Composite: Renders a green line between points (303, 201) and (244, 197) then Places a magenta dot at position (45, 247).
; PLAN: r0=303(x1), r1=201(y1), r2=244(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=247(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 303
LDI r1, 201
LDI r2, 244
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 247
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
