; DESCRIPTION: Renders a yellow line between points (246, 154) and (135, 44).
; PLAN: r0=246(x1), r1=154(y1), r2=135(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 154
LDI r2, 135
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
