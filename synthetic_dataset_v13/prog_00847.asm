; DESCRIPTION: Renders a green line between points (60, 247) and (161, 183).
; PLAN: r0=60(x1), r1=247(y1), r2=161(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 247
LDI r2, 161
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
