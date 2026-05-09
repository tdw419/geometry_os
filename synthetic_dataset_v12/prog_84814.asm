; DESCRIPTION: Renders a black line between points (168, 0) and (112, 188).
; PLAN: r0=168(x1), r1=0(y1), r2=112(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 0
LDI r2, 112
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
