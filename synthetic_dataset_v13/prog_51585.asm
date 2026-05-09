; DESCRIPTION: Renders a green line between points (154, 89) and (467, 63).
; PLAN: r0=154(x1), r1=89(y1), r2=467(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 89
LDI r2, 467
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
