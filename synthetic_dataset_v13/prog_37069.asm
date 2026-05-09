; DESCRIPTION: Composite: Sets a single black pixel at (509, 6) then Renders a orange line between points (327, 25) and (337, 47).
; PLAN: r0=509(x), r1=6(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=327(x1), r6=25(y1), r7=337(x2), r8=47(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 509
LDI r1, 6
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 327
LDI r6, 25
LDI r7, 337
LDI r8, 47
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
