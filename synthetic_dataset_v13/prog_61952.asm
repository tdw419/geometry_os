; DESCRIPTION: Draws a black line from (193, 193) to (271, 87).
; PLAN: r0=193(x1), r1=193(y1), r2=271(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 193
LDI r2, 271
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
