; DESCRIPTION: Renders a green line between points (25, 70) and (69, 130).
; PLAN: r0=25(x1), r1=70(y1), r2=69(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 70
LDI r2, 69
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
