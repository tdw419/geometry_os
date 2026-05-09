; DESCRIPTION: Renders a black line between points (5, 154) and (113, 106).
; PLAN: r0=5(x1), r1=154(y1), r2=113(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 154
LDI r2, 113
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
