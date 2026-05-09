; DESCRIPTION: Draws a green line from (58, 95) to (443, 62).
; PLAN: r0=58(x1), r1=95(y1), r2=443(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 95
LDI r2, 443
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
