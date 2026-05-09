; DESCRIPTION: Renders a green line between points (87, 247) and (35, 217).
; PLAN: r0=87(x1), r1=247(y1), r2=35(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 247
LDI r2, 35
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
