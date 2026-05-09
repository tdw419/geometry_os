; DESCRIPTION: Places a cyan line segment connecting (388, 81) to (250, 194).
; PLAN: r0=388(x1), r1=81(y1), r2=250(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 81
LDI r2, 250
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
