; DESCRIPTION: Renders a green line between points (38, 191) and (109, 31).
; PLAN: r0=38(x1), r1=191(y1), r2=109(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 191
LDI r2, 109
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
