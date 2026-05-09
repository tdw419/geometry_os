; DESCRIPTION: Renders a green line between points (507, 100) and (350, 72).
; PLAN: r0=507(x1), r1=100(y1), r2=350(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 100
LDI r2, 350
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
