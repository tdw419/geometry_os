; DESCRIPTION: Places a green line segment connecting (473, 180) to (168, 123).
; PLAN: r0=473(x1), r1=180(y1), r2=168(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 180
LDI r2, 168
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
