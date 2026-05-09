; DESCRIPTION: Renders a green line between points (50, 50) and (161, 63).
; PLAN: r0=50(x1), r1=50(y1), r2=161(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 50
LDI r2, 161
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
