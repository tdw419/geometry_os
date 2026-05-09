; DESCRIPTION: Draws a yellow line from (443, 115) to (204, 193).
; PLAN: r0=443(x1), r1=115(y1), r2=204(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 115
LDI r2, 204
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
