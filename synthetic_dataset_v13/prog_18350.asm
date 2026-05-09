; DESCRIPTION: Draws a yellow line from (443, 103) to (326, 149).
; PLAN: r0=443(x1), r1=103(y1), r2=326(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 103
LDI r2, 326
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
