; DESCRIPTION: Renders a blue line between points (403, 114) and (18, 30).
; PLAN: r0=403(x1), r1=114(y1), r2=18(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 114
LDI r2, 18
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
