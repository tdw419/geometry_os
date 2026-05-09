; DESCRIPTION: Renders a black line between points (452, 210) and (387, 33).
; PLAN: r0=452(x1), r1=210(y1), r2=387(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 210
LDI r2, 387
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
