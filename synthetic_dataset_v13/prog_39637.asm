; DESCRIPTION: Composite: Places a yellow dot at position (2, 82) then Renders a cyan line between points (38, 114) and (407, 136).
; PLAN: r0=2(x), r1=82(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=38(x1), r6=114(y1), r7=407(x2), r8=136(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 82
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 38
LDI r6, 114
LDI r7, 407
LDI r8, 136
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
