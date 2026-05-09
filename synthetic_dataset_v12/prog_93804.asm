; DESCRIPTION: Composite: Places a blue dot at position (91, 100) then Draws a orange line from (492, 179) to (152, 88).
; PLAN: r0=91(x), r1=100(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=492(x1), r6=179(y1), r7=152(x2), r8=88(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 100
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 492
LDI r6, 179
LDI r7, 152
LDI r8, 88
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
