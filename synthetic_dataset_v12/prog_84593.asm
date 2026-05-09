; DESCRIPTION: Draws a black line from (164, 79) to (76, 94).
; PLAN: r0=164(x1), r1=79(y1), r2=76(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 79
LDI r2, 76
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
