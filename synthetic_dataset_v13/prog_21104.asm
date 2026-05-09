; DESCRIPTION: Draws a yellow line from (79, 18) to (370, 18).
; PLAN: r0=79(x1), r1=18(y1), r2=370(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 18
LDI r2, 370
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
