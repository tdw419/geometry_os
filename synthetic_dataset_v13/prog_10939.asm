; DESCRIPTION: Renders a green line between points (215, 99) and (84, 218).
; PLAN: r0=215(x1), r1=99(y1), r2=84(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 99
LDI r2, 84
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
