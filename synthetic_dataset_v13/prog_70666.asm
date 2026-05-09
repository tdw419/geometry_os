; DESCRIPTION: Places a cyan line segment connecting (408, 164) to (378, 119).
; PLAN: r0=408(x1), r1=164(y1), r2=378(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 164
LDI r2, 378
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
