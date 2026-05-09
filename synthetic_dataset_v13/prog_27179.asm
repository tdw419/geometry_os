; DESCRIPTION: Renders a green line between points (421, 37) and (231, 22).
; PLAN: r0=421(x1), r1=37(y1), r2=231(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 37
LDI r2, 231
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
