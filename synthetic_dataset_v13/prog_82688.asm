; DESCRIPTION: Renders a blue line between points (387, 187) and (27, 123).
; PLAN: r0=387(x1), r1=187(y1), r2=27(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 187
LDI r2, 27
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
