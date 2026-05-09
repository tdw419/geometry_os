; DESCRIPTION: Renders a green line between points (349, 19) and (383, 133).
; PLAN: r0=349(x1), r1=19(y1), r2=383(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 19
LDI r2, 383
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
