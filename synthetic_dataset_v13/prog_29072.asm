; DESCRIPTION: Renders a green line between points (118, 64) and (3, 172).
; PLAN: r0=118(x1), r1=64(y1), r2=3(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 64
LDI r2, 3
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
