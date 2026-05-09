; DESCRIPTION: Draws a black line from (236, 242) to (389, 188).
; PLAN: r0=236(x1), r1=242(y1), r2=389(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 242
LDI r2, 389
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
