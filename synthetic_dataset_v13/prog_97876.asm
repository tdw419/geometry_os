; DESCRIPTION: Renders a green line between points (160, 121) and (151, 252).
; PLAN: r0=160(x1), r1=121(y1), r2=151(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 121
LDI r2, 151
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
