; DESCRIPTION: Renders a green line between points (149, 218) and (305, 68).
; PLAN: r0=149(x1), r1=218(y1), r2=305(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 218
LDI r2, 305
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
