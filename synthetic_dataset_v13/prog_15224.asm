; DESCRIPTION: Renders a black line between points (391, 249) and (361, 114).
; PLAN: r0=391(x1), r1=249(y1), r2=361(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 249
LDI r2, 361
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
