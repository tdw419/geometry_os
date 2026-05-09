; DESCRIPTION: Draws a green line from (167, 159) to (443, 206).
; PLAN: r0=167(x1), r1=159(y1), r2=443(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 159
LDI r2, 443
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
