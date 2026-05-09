; DESCRIPTION: Draws a black line from (119, 236) to (282, 186).
; PLAN: r0=119(x1), r1=236(y1), r2=282(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 236
LDI r2, 282
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
