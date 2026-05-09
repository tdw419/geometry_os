; DESCRIPTION: Renders a yellow line between points (111, 63) and (0, 91).
; PLAN: r0=111(x1), r1=63(y1), r2=0(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 63
LDI r2, 0
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
