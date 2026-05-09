; DESCRIPTION: Renders a green line between points (172, 149) and (269, 88).
; PLAN: r0=172(x1), r1=149(y1), r2=269(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 149
LDI r2, 269
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
