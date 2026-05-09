; DESCRIPTION: Renders a green line between points (111, 232) and (196, 10).
; PLAN: r0=111(x1), r1=232(y1), r2=196(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 232
LDI r2, 196
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
