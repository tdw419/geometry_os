; DESCRIPTION: Places a black line segment connecting (365, 93) to (156, 207).
; PLAN: r0=365(x1), r1=93(y1), r2=156(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 93
LDI r2, 156
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
