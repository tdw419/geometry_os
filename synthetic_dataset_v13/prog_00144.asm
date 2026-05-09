; DESCRIPTION: Places a green line segment connecting (471, 75) to (434, 15).
; PLAN: r0=471(x1), r1=75(y1), r2=434(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 75
LDI r2, 434
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
