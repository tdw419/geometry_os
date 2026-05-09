; DESCRIPTION: Renders a blue line between points (187, 91) and (254, 5).
; PLAN: r0=187(x1), r1=91(y1), r2=254(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 91
LDI r2, 254
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
