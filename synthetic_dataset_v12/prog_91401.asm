; DESCRIPTION: Places a green line segment connecting (510, 60) to (95, 251).
; PLAN: r0=510(x1), r1=60(y1), r2=95(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 60
LDI r2, 95
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
