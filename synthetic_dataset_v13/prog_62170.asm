; DESCRIPTION: Draws a black line from (342, 134) to (402, 168).
; PLAN: r0=342(x1), r1=134(y1), r2=402(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 134
LDI r2, 402
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
