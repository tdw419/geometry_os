; DESCRIPTION: Renders a yellow line between points (157, 154) and (1, 96).
; PLAN: r0=157(x1), r1=154(y1), r2=1(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 154
LDI r2, 1
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
