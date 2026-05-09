; DESCRIPTION: Composite: Renders a magenta line between points (370, 50) and (208, 137) then Places a yellow dot at position (458, 8).
; PLAN: r0=370(x1), r1=50(y1), r2=208(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=8(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 50
LDI r2, 208
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 8
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
