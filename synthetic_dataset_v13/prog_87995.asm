; DESCRIPTION: Draws a blue line from (443, 134) to (98, 69).
; PLAN: r0=443(x1), r1=134(y1), r2=98(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 134
LDI r2, 98
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
