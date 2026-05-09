; DESCRIPTION: Renders a green line between points (375, 74) and (60, 82).
; PLAN: r0=375(x1), r1=74(y1), r2=60(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 74
LDI r2, 60
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
