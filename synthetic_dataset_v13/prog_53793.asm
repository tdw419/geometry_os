; DESCRIPTION: Renders a green line between points (473, 231) and (124, 131).
; PLAN: r0=473(x1), r1=231(y1), r2=124(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 231
LDI r2, 124
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
