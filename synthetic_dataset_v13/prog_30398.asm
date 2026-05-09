; DESCRIPTION: Renders a green line between points (85, 220) and (205, 92).
; PLAN: r0=85(x1), r1=220(y1), r2=205(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 220
LDI r2, 205
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
