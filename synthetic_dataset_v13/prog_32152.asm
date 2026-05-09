; DESCRIPTION: Composite: Places a yellow dot at position (22, 85) then Renders a red line between points (90, 110) and (310, 27).
; PLAN: r0=22(x), r1=85(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=90(x1), r6=110(y1), r7=310(x2), r8=27(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 22
LDI r1, 85
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 90
LDI r6, 110
LDI r7, 310
LDI r8, 27
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
