; DESCRIPTION: Composite: Places a red line segment connecting (411, 97) to (158, 79) then Places a green dot at position (236, 78).
; PLAN: r0=411(x1), r1=97(y1), r2=158(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=78(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 411
LDI r1, 97
LDI r2, 158
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 78
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
