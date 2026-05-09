; DESCRIPTION: Draws a black line from (475, 5) to (68, 82).
; PLAN: r0=475(x1), r1=5(y1), r2=68(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 5
LDI r2, 68
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
