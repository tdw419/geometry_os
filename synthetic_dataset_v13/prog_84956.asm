; DESCRIPTION: Draws a yellow line from (321, 158) to (146, 43).
; PLAN: r0=321(x1), r1=158(y1), r2=146(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 158
LDI r2, 146
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
