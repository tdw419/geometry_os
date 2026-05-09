; DESCRIPTION: Renders a green line between points (395, 234) and (46, 53).
; PLAN: r0=395(x1), r1=234(y1), r2=46(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 234
LDI r2, 46
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
