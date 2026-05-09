; DESCRIPTION: Places a red line segment connecting (226, 50) to (494, 57).
; PLAN: r0=226(x1), r1=50(y1), r2=494(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 50
LDI r2, 494
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
