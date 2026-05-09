; DESCRIPTION: Renders a yellow line between points (38, 135) and (63, 83).
; PLAN: r0=38(x1), r1=135(y1), r2=63(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 135
LDI r2, 63
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
