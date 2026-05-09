; DESCRIPTION: Renders a yellow line between points (62, 166) and (127, 48).
; PLAN: r0=62(x1), r1=166(y1), r2=127(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 166
LDI r2, 127
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
