; DESCRIPTION: Renders a green line between points (258, 124) and (46, 85).
; PLAN: r0=258(x1), r1=124(y1), r2=46(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 124
LDI r2, 46
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
