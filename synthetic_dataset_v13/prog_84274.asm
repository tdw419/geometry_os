; DESCRIPTION: Renders a green line between points (313, 149) and (13, 181).
; PLAN: r0=313(x1), r1=149(y1), r2=13(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 149
LDI r2, 13
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
