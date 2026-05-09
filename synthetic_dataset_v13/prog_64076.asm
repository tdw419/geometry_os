; DESCRIPTION: Places a white line segment connecting (265, 202) to (238, 100).
; PLAN: r0=265(x1), r1=202(y1), r2=238(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 202
LDI r2, 238
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
