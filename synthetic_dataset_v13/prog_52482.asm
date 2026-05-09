; DESCRIPTION: Draws a black line from (20, 187) to (146, 169).
; PLAN: r0=20(x1), r1=187(y1), r2=146(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 187
LDI r2, 146
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
