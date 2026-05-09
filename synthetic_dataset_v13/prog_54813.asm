; DESCRIPTION: Draws a yellow line from (146, 4) to (370, 185).
; PLAN: r0=146(x1), r1=4(y1), r2=370(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 4
LDI r2, 370
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
