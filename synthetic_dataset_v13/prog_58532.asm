; DESCRIPTION: Renders a black line between points (307, 233) and (112, 233).
; PLAN: r0=307(x1), r1=233(y1), r2=112(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 233
LDI r2, 112
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
