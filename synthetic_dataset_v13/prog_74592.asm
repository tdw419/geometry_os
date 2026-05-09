; DESCRIPTION: Renders a yellow line between points (69, 93) and (313, 35).
; PLAN: r0=69(x1), r1=93(y1), r2=313(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 93
LDI r2, 313
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
