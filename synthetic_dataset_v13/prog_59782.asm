; DESCRIPTION: Renders a yellow line between points (99, 242) and (134, 38).
; PLAN: r0=99(x1), r1=242(y1), r2=134(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 242
LDI r2, 134
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
