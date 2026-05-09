; DESCRIPTION: Draws a black line from (393, 212) to (391, 64).
; PLAN: r0=393(x1), r1=212(y1), r2=391(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 212
LDI r2, 391
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
