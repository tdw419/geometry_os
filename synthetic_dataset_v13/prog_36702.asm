; DESCRIPTION: Renders a green line between points (61, 72) and (342, 248).
; PLAN: r0=61(x1), r1=72(y1), r2=342(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 72
LDI r2, 342
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
