; DESCRIPTION: Places a green line segment connecting (467, 121) to (143, 74).
; PLAN: r0=467(x1), r1=121(y1), r2=143(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 121
LDI r2, 143
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
