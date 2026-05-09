; DESCRIPTION: Places a red line segment connecting (193, 54) to (52, 132).
; PLAN: r0=193(x1), r1=54(y1), r2=52(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 54
LDI r2, 52
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
