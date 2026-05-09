; DESCRIPTION: Renders a green line between points (95, 65) and (468, 22).
; PLAN: r0=95(x1), r1=65(y1), r2=468(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 65
LDI r2, 468
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
