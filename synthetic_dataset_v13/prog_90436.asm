; DESCRIPTION: Renders a blue line between points (98, 91) and (71, 239).
; PLAN: r0=98(x1), r1=91(y1), r2=71(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 91
LDI r2, 71
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
