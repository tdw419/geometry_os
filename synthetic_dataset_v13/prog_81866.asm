; DESCRIPTION: Renders a green line between points (443, 167) and (150, 226).
; PLAN: r0=443(x1), r1=167(y1), r2=150(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 167
LDI r2, 150
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
