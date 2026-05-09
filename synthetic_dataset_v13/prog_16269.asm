; DESCRIPTION: Places a red line segment connecting (143, 32) to (51, 60).
; PLAN: r0=143(x1), r1=32(y1), r2=51(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 32
LDI r2, 51
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
