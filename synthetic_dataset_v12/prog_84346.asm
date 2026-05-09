; DESCRIPTION: Draws a black line from (212, 242) to (188, 185).
; PLAN: r0=212(x1), r1=242(y1), r2=188(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 242
LDI r2, 188
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
