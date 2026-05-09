; DESCRIPTION: Renders a yellow line between points (365, 153) and (165, 52).
; PLAN: r0=365(x1), r1=153(y1), r2=165(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 153
LDI r2, 165
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
