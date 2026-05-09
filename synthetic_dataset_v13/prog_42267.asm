; DESCRIPTION: Renders a green line between points (65, 14) and (133, 242).
; PLAN: r0=65(x1), r1=14(y1), r2=133(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 14
LDI r2, 133
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
