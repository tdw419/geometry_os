; DESCRIPTION: Composite: Places a yellow dot at position (5, 176) then Draws a orange line from (23, 148) to (332, 120).
; PLAN: r0=5(x), r1=176(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=23(x1), r6=148(y1), r7=332(x2), r8=120(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 176
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 23
LDI r6, 148
LDI r7, 332
LDI r8, 120
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
