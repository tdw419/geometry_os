; DESCRIPTION: Renders a green line between points (114, 53) and (36, 84).
; PLAN: r0=114(x1), r1=53(y1), r2=36(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 53
LDI r2, 36
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
