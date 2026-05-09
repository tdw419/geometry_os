; DESCRIPTION: Composite: Draws a blue line from (275, 140) to (157, 52) then Places a yellow dot at position (192, 247).
; PLAN: r0=275(x1), r1=140(y1), r2=157(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=247(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 275
LDI r1, 140
LDI r2, 157
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 247
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
