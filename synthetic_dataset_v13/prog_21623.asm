; DESCRIPTION: Composite: Places a red dot at position (112, 198) then Renders a green line between points (52, 18) and (25, 69).
; PLAN: r0=112(x), r1=198(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=52(x1), r6=18(y1), r7=25(x2), r8=69(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 198
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 52
LDI r6, 18
LDI r7, 25
LDI r8, 69
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
