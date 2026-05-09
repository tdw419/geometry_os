; DESCRIPTION: Renders a black line between points (217, 204) and (477, 164).
; PLAN: r0=217(x1), r1=204(y1), r2=477(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 204
LDI r2, 477
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
