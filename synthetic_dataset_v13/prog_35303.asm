; DESCRIPTION: Places a red line segment connecting (434, 52) to (508, 93).
; PLAN: r0=434(x1), r1=52(y1), r2=508(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 52
LDI r2, 508
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
