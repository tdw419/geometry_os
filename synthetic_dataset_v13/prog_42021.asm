; DESCRIPTION: Renders a green line between points (150, 6) and (107, 189).
; PLAN: r0=150(x1), r1=6(y1), r2=107(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 6
LDI r2, 107
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
