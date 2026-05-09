; DESCRIPTION: Draws a black line from (87, 176) to (336, 68).
; PLAN: r0=87(x1), r1=176(y1), r2=336(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 176
LDI r2, 336
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
