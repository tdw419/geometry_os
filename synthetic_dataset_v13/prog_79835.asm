; DESCRIPTION: Renders a yellow line between points (18, 4) and (410, 62).
; PLAN: r0=18(x1), r1=4(y1), r2=410(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 4
LDI r2, 410
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
