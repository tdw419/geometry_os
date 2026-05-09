; DESCRIPTION: Renders a green line between points (379, 210) and (57, 70).
; PLAN: r0=379(x1), r1=210(y1), r2=57(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 210
LDI r2, 57
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
