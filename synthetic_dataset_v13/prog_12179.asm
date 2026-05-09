; DESCRIPTION: Renders a green line between points (326, 19) and (84, 62).
; PLAN: r0=326(x1), r1=19(y1), r2=84(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 19
LDI r2, 84
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
