; DESCRIPTION: Renders a green line between points (219, 168) and (63, 99).
; PLAN: r0=219(x1), r1=168(y1), r2=63(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 168
LDI r2, 63
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
