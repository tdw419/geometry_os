; DESCRIPTION: Renders a green line between points (79, 74) and (15, 98).
; PLAN: r0=79(x1), r1=74(y1), r2=15(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 74
LDI r2, 15
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
