; DESCRIPTION: Renders a green line between points (133, 26) and (445, 247).
; PLAN: r0=133(x1), r1=26(y1), r2=445(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 26
LDI r2, 445
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
