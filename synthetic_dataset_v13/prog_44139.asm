; DESCRIPTION: Renders a green line between points (131, 210) and (387, 181).
; PLAN: r0=131(x1), r1=210(y1), r2=387(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 210
LDI r2, 387
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
