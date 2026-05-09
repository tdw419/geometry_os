; DESCRIPTION: Draws a black line from (392, 237) to (139, 74).
; PLAN: r0=392(x1), r1=237(y1), r2=139(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 237
LDI r2, 139
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
