; DESCRIPTION: Places a red line segment connecting (373, 93) to (358, 8).
; PLAN: r0=373(x1), r1=93(y1), r2=358(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 93
LDI r2, 358
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
