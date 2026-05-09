; DESCRIPTION: Composite: Renders a cyan line between points (201, 49) and (433, 32) then Places a magenta dot at position (159, 24).
; PLAN: r0=201(x1), r1=49(y1), r2=433(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=24(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 201
LDI r1, 49
LDI r2, 433
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 24
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
