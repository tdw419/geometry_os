; DESCRIPTION: Draws a black line from (142, 147) to (410, 188).
; PLAN: r0=142(x1), r1=147(y1), r2=410(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 147
LDI r2, 410
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
