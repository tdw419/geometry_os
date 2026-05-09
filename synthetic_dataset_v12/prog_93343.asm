; DESCRIPTION: Draws a black line from (300, 117) to (68, 165).
; PLAN: r0=300(x1), r1=117(y1), r2=68(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 117
LDI r2, 68
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
