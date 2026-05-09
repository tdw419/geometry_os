; DESCRIPTION: Renders a green line between points (311, 152) and (50, 63).
; PLAN: r0=311(x1), r1=152(y1), r2=50(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 152
LDI r2, 50
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
