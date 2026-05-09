; DESCRIPTION: Draws a black line from (211, 169) to (197, 192).
; PLAN: r0=211(x1), r1=169(y1), r2=197(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 169
LDI r2, 197
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
