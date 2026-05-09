; DESCRIPTION: Places a red line segment connecting (113, 197) to (109, 112).
; PLAN: r0=113(x1), r1=197(y1), r2=109(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 197
LDI r2, 109
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
