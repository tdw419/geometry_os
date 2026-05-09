; DESCRIPTION: Places a yellow line segment connecting (241, 143) to (61, 171).
; PLAN: r0=241(x1), r1=143(y1), r2=61(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 143
LDI r2, 61
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
