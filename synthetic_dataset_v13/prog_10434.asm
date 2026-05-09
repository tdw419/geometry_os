; DESCRIPTION: Renders a green line between points (349, 61) and (269, 168).
; PLAN: r0=349(x1), r1=61(y1), r2=269(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 61
LDI r2, 269
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
