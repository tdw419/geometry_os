; DESCRIPTION: Renders a yellow line between points (299, 70) and (299, 50).
; PLAN: r0=299(x1), r1=70(y1), r2=299(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 70
LDI r2, 299
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
