; DESCRIPTION: Renders a red line between points (326, 69) and (449, 118).
; PLAN: r0=326(x1), r1=69(y1), r2=449(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 69
LDI r2, 449
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
