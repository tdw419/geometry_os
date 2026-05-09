; DESCRIPTION: Renders a red line between points (325, 56) and (168, 105).
; PLAN: r0=325(x1), r1=56(y1), r2=168(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 56
LDI r2, 168
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
