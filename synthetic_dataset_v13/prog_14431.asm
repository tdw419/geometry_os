; DESCRIPTION: Renders a red line between points (385, 98) and (103, 70).
; PLAN: r0=385(x1), r1=98(y1), r2=103(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 98
LDI r2, 103
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
