; DESCRIPTION: Renders a green line between points (165, 127) and (184, 2).
; PLAN: r0=165(x1), r1=127(y1), r2=184(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 127
LDI r2, 184
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
