; DESCRIPTION: Renders a blue line between points (168, 232) and (52, 242).
; PLAN: r0=168(x1), r1=232(y1), r2=52(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 232
LDI r2, 52
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
