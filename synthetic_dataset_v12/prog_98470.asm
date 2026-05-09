; DESCRIPTION: Places a red line segment connecting (25, 117) to (3, 143).
; PLAN: r0=25(x1), r1=117(y1), r2=3(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 117
LDI r2, 3
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
