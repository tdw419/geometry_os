; DESCRIPTION: Renders a green line between points (142, 247) and (243, 163).
; PLAN: r0=142(x1), r1=247(y1), r2=243(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 247
LDI r2, 243
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
