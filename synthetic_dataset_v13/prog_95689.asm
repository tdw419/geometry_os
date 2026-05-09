; DESCRIPTION: Renders a green line between points (65, 136) and (150, 48).
; PLAN: r0=65(x1), r1=136(y1), r2=150(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 136
LDI r2, 150
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
