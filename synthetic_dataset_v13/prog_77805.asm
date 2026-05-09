; DESCRIPTION: Composite: Places a black dot at position (406, 157) then Draws a orange line from (105, 180) to (248, 121).
; PLAN: r0=406(x), r1=157(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=105(x1), r6=180(y1), r7=248(x2), r8=121(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 157
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 105
LDI r6, 180
LDI r7, 248
LDI r8, 121
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
