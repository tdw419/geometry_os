; DESCRIPTION: Renders a black line between points (42, 112) and (172, 121).
; PLAN: r0=42(x1), r1=112(y1), r2=172(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 112
LDI r2, 172
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
