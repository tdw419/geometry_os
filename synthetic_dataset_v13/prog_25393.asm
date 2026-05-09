; DESCRIPTION: Renders a yellow line between points (24, 213) and (5, 121).
; PLAN: r0=24(x1), r1=213(y1), r2=5(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 213
LDI r2, 5
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
