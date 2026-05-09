; DESCRIPTION: Places a white line segment connecting (0, 151) to (193, 158).
; PLAN: r0=0(x1), r1=151(y1), r2=193(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 151
LDI r2, 193
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
