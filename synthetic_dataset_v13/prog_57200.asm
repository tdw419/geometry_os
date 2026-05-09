; DESCRIPTION: Composite: Renders a yellow line between points (296, 208) and (414, 212) then Places a cyan dot at position (10, 142).
; PLAN: r0=296(x1), r1=208(y1), r2=414(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=142(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 296
LDI r1, 208
LDI r2, 414
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 142
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
