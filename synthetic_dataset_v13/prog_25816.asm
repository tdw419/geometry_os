; DESCRIPTION: Draws a blue line from (341, 21) to (308, 132).
; PLAN: r0=341(x1), r1=21(y1), r2=308(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 21
LDI r2, 308
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
