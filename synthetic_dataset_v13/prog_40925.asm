; DESCRIPTION: Draws a black line from (76, 134) to (150, 220).
; PLAN: r0=76(x1), r1=134(y1), r2=150(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 134
LDI r2, 150
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
