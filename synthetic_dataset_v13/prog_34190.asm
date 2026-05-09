; DESCRIPTION: Renders a green line between points (379, 100) and (281, 66).
; PLAN: r0=379(x1), r1=100(y1), r2=281(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 100
LDI r2, 281
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
