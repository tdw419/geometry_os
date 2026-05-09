; DESCRIPTION: Composite: Places a red dot at position (127, 218) then Draws a blue line from (438, 7) to (70, 79).
; PLAN: r0=127(x), r1=218(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=438(x1), r6=7(y1), r7=70(x2), r8=79(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 218
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 438
LDI r6, 7
LDI r7, 70
LDI r8, 79
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
