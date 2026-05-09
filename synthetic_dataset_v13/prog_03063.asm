; DESCRIPTION: Renders a green line between points (423, 94) and (291, 39).
; PLAN: r0=423(x1), r1=94(y1), r2=291(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 94
LDI r2, 291
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
