; DESCRIPTION: Composite: Places a black dot at position (296, 73) then Draws a orange line from (138, 9) to (470, 140).
; PLAN: r0=296(x), r1=73(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=138(x1), r6=9(y1), r7=470(x2), r8=140(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 73
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 138
LDI r6, 9
LDI r7, 470
LDI r8, 140
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
