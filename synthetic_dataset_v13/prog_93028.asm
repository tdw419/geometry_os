; DESCRIPTION: Renders a green line between points (340, 115) and (93, 69).
; PLAN: r0=340(x1), r1=115(y1), r2=93(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 115
LDI r2, 93
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
