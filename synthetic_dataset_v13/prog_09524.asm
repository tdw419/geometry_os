; DESCRIPTION: Composite: Places a orange dot at position (304, 200) then Draws a blue line from (117, 50) to (22, 102).
; PLAN: r0=304(x), r1=200(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=117(x1), r6=50(y1), r7=22(x2), r8=102(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 200
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 117
LDI r6, 50
LDI r7, 22
LDI r8, 102
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
