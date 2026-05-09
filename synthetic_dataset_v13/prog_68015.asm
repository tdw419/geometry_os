; DESCRIPTION: Renders a green line between points (241, 108) and (423, 65).
; PLAN: r0=241(x1), r1=108(y1), r2=423(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 108
LDI r2, 423
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
