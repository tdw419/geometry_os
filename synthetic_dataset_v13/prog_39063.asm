; DESCRIPTION: Renders a yellow line between points (181, 168) and (7, 46).
; PLAN: r0=181(x1), r1=168(y1), r2=7(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 168
LDI r2, 7
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
