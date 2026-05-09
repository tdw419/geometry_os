; DESCRIPTION: Renders a green line between points (291, 61) and (120, 123).
; PLAN: r0=291(x1), r1=61(y1), r2=120(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 61
LDI r2, 120
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
