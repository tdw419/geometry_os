; DESCRIPTION: Renders a green line between points (345, 19) and (349, 226).
; PLAN: r0=345(x1), r1=19(y1), r2=349(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 19
LDI r2, 349
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
