; DESCRIPTION: Renders a green line between points (313, 119) and (39, 61).
; PLAN: r0=313(x1), r1=119(y1), r2=39(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 119
LDI r2, 39
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
