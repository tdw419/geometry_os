; DESCRIPTION: Renders a green line between points (75, 134) and (103, 180).
; PLAN: r0=75(x1), r1=134(y1), r2=103(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 134
LDI r2, 103
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
