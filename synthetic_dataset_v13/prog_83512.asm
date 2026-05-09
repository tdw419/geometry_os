; DESCRIPTION: Draws a green line from (443, 65) to (214, 129).
; PLAN: r0=443(x1), r1=65(y1), r2=214(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 65
LDI r2, 214
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
