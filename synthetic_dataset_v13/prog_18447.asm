; DESCRIPTION: Composite: Places a black dot at position (200, 45) then Renders a magenta line between points (8, 166) and (14, 41).
; PLAN: r0=200(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=8(x1), r6=166(y1), r7=14(x2), r8=41(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 45
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 8
LDI r6, 166
LDI r7, 14
LDI r8, 41
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
