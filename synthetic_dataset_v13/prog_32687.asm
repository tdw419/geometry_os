; DESCRIPTION: Renders a green line between points (473, 156) and (135, 90).
; PLAN: r0=473(x1), r1=156(y1), r2=135(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 156
LDI r2, 135
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
