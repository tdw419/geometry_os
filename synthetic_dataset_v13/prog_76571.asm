; DESCRIPTION: Composite: Places a orange dot at position (2, 92) then Draws a yellow line from (80, 98) to (162, 175).
; PLAN: r0=2(x), r1=92(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=80(x1), r6=98(y1), r7=162(x2), r8=175(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 92
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 80
LDI r6, 98
LDI r7, 162
LDI r8, 175
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
