; DESCRIPTION: Renders a green line between points (410, 1) and (359, 85).
; PLAN: r0=410(x1), r1=1(y1), r2=359(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 1
LDI r2, 359
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
