; DESCRIPTION: Draws a yellow line from (12, 13) to (443, 165).
; PLAN: r0=12(x1), r1=13(y1), r2=443(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 13
LDI r2, 443
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
