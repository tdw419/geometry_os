; DESCRIPTION: Renders a blue line between points (108, 9) and (242, 41).
; PLAN: r0=108(x1), r1=9(y1), r2=242(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 9
LDI r2, 242
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
