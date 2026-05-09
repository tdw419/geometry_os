; DESCRIPTION: Renders a green line between points (198, 184) and (279, 194).
; PLAN: r0=198(x1), r1=184(y1), r2=279(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 184
LDI r2, 279
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
