; DESCRIPTION: Composite: Places a yellow dot at position (45, 227) then Renders a black line between points (82, 35) and (270, 255).
; PLAN: r0=45(x), r1=227(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=82(x1), r6=35(y1), r7=270(x2), r8=255(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 227
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 82
LDI r6, 35
LDI r7, 270
LDI r8, 255
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
