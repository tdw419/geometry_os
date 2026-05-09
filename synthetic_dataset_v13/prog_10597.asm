; DESCRIPTION: Renders a black line between points (198, 107) and (314, 126).
; PLAN: r0=198(x1), r1=107(y1), r2=314(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 107
LDI r2, 314
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
