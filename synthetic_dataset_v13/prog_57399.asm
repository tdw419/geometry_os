; DESCRIPTION: Renders a green line between points (66, 232) and (70, 50).
; PLAN: r0=66(x1), r1=232(y1), r2=70(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 232
LDI r2, 70
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
