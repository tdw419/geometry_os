; DESCRIPTION: Renders a green line between points (385, 230) and (221, 10).
; PLAN: r0=385(x1), r1=230(y1), r2=221(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 230
LDI r2, 221
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
