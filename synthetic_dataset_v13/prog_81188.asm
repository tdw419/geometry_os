; DESCRIPTION: Places a purple line segment connecting (42, 93) to (89, 75).
; PLAN: r0=42(x1), r1=93(y1), r2=89(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 93
LDI r2, 89
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
