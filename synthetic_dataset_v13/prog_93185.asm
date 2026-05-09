; DESCRIPTION: Renders a green line between points (504, 10) and (85, 7).
; PLAN: r0=504(x1), r1=10(y1), r2=85(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 10
LDI r2, 85
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
