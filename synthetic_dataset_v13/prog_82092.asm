; DESCRIPTION: Renders a blue line between points (180, 24) and (202, 61).
; PLAN: r0=180(x1), r1=24(y1), r2=202(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 24
LDI r2, 202
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
