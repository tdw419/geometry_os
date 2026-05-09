; DESCRIPTION: Places a blue line segment connecting (443, 183) to (42, 2).
; PLAN: r0=443(x1), r1=183(y1), r2=42(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 183
LDI r2, 42
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
