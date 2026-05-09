; DESCRIPTION: Renders a yellow line between points (135, 134) and (386, 245).
; PLAN: r0=135(x1), r1=134(y1), r2=386(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 134
LDI r2, 386
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
