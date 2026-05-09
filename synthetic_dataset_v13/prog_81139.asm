; DESCRIPTION: Renders a blue line between points (443, 122) and (100, 174).
; PLAN: r0=443(x1), r1=122(y1), r2=100(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 122
LDI r2, 100
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
