; DESCRIPTION: Draws a black line from (95, 112) to (274, 65).
; PLAN: r0=95(x1), r1=112(y1), r2=274(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 112
LDI r2, 274
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
