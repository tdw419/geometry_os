; DESCRIPTION: Renders a green line between points (493, 241) and (262, 44).
; PLAN: r0=493(x1), r1=241(y1), r2=262(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 241
LDI r2, 262
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
