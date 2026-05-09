; DESCRIPTION: Renders a green line between points (108, 89) and (411, 27).
; PLAN: r0=108(x1), r1=89(y1), r2=411(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 89
LDI r2, 411
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
