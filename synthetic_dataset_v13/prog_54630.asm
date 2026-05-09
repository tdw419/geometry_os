; DESCRIPTION: Renders a green line between points (21, 189) and (94, 184).
; PLAN: r0=21(x1), r1=189(y1), r2=94(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 189
LDI r2, 94
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
