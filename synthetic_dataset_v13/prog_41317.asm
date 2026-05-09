; DESCRIPTION: Draws a black line from (115, 215) to (137, 87).
; PLAN: r0=115(x1), r1=215(y1), r2=137(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 215
LDI r2, 137
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
