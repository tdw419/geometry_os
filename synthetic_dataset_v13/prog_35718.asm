; DESCRIPTION: Renders a red line between points (484, 42) and (366, 44).
; PLAN: r0=484(x1), r1=42(y1), r2=366(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 42
LDI r2, 366
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
