; DESCRIPTION: Renders a black line between points (64, 107) and (167, 155).
; PLAN: r0=64(x1), r1=107(y1), r2=167(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 107
LDI r2, 167
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
