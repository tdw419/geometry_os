; DESCRIPTION: Renders a blue line between points (458, 91) and (108, 241).
; PLAN: r0=458(x1), r1=91(y1), r2=108(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 91
LDI r2, 108
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
