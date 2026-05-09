; DESCRIPTION: Renders a green line between points (115, 85) and (28, 117).
; PLAN: r0=115(x1), r1=85(y1), r2=28(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 85
LDI r2, 28
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
