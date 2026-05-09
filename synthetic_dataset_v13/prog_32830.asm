; DESCRIPTION: Places a red line segment connecting (481, 132) to (463, 143).
; PLAN: r0=481(x1), r1=132(y1), r2=463(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 132
LDI r2, 463
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
