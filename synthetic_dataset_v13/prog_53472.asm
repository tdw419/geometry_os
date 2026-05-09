; DESCRIPTION: Renders a black line between points (51, 253) and (119, 213).
; PLAN: r0=51(x1), r1=253(y1), r2=119(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 253
LDI r2, 119
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
