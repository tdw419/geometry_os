; DESCRIPTION: Composite: Places a red line segment connecting (231, 0) to (35, 166) then Places a green dot at position (145, 145).
; PLAN: r0=231(x1), r1=0(y1), r2=35(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=145(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 231
LDI r1, 0
LDI r2, 35
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 145
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
