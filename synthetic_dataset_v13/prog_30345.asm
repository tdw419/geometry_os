; DESCRIPTION: Renders a black line between points (253, 187) and (57, 124).
; PLAN: r0=253(x1), r1=187(y1), r2=57(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 187
LDI r2, 57
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
