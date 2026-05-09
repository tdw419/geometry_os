; DESCRIPTION: Places a cyan line segment connecting (75, 150) to (323, 189).
; PLAN: r0=75(x1), r1=150(y1), r2=323(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 150
LDI r2, 323
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
