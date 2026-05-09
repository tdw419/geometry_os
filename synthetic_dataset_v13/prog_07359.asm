; DESCRIPTION: Renders a yellow line between points (106, 113) and (154, 83).
; PLAN: r0=106(x1), r1=113(y1), r2=154(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 113
LDI r2, 154
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
