; DESCRIPTION: Draws a blue line from (44, 42) to (443, 194).
; PLAN: r0=44(x1), r1=42(y1), r2=443(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 42
LDI r2, 443
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
