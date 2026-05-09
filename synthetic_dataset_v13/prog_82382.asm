; DESCRIPTION: Draws a blue line from (420, 221) to (443, 58).
; PLAN: r0=420(x1), r1=221(y1), r2=443(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 221
LDI r2, 443
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
