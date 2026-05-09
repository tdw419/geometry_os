; DESCRIPTION: Renders a green line between points (493, 47) and (395, 184).
; PLAN: r0=493(x1), r1=47(y1), r2=395(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 47
LDI r2, 395
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
