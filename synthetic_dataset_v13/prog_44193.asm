; DESCRIPTION: Draws a black line from (244, 8) to (475, 127).
; PLAN: r0=244(x1), r1=8(y1), r2=475(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 8
LDI r2, 475
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
