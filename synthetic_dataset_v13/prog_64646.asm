; DESCRIPTION: Renders a yellow line between points (313, 48) and (123, 82).
; PLAN: r0=313(x1), r1=48(y1), r2=123(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 48
LDI r2, 123
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
