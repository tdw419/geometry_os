; DESCRIPTION: Renders a green line between points (12, 40) and (26, 6).
; PLAN: r0=12(x1), r1=40(y1), r2=26(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 40
LDI r2, 26
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
