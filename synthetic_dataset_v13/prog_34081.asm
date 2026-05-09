; DESCRIPTION: Renders a yellow line between points (33, 184) and (243, 156).
; PLAN: r0=33(x1), r1=184(y1), r2=243(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 184
LDI r2, 243
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
