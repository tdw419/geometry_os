; DESCRIPTION: Renders a green line between points (26, 148) and (154, 99).
; PLAN: r0=26(x1), r1=148(y1), r2=154(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 148
LDI r2, 154
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
