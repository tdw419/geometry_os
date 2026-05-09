; DESCRIPTION: Renders a green line between points (131, 239) and (133, 31).
; PLAN: r0=131(x1), r1=239(y1), r2=133(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 239
LDI r2, 133
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
