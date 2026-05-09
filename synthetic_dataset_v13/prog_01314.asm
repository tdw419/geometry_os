; DESCRIPTION: Draws a purple line from (439, 175) to (146, 181).
; PLAN: r0=439(x1), r1=175(y1), r2=146(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 175
LDI r2, 146
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
