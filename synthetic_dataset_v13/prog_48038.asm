; DESCRIPTION: Renders a yellow line between points (387, 28) and (496, 38).
; PLAN: r0=387(x1), r1=28(y1), r2=496(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 28
LDI r2, 496
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
