; DESCRIPTION: Composite: Places a green dot at position (292, 3) then Draws a yellow line from (45, 234) to (85, 169).
; PLAN: r0=292(x), r1=3(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=45(x1), r6=234(y1), r7=85(x2), r8=169(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 3
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 45
LDI r6, 234
LDI r7, 85
LDI r8, 169
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
