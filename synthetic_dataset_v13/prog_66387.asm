; DESCRIPTION: Renders a yellow line between points (84, 241) and (387, 127).
; PLAN: r0=84(x1), r1=241(y1), r2=387(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 241
LDI r2, 387
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
