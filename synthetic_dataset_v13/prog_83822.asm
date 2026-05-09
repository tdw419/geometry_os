; DESCRIPTION: Renders a green line between points (76, 91) and (69, 149).
; PLAN: r0=76(x1), r1=91(y1), r2=69(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 91
LDI r2, 69
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
