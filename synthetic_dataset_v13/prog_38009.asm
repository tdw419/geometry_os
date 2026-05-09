; DESCRIPTION: Draws a green line from (146, 106) to (217, 123).
; PLAN: r0=146(x1), r1=106(y1), r2=217(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 106
LDI r2, 217
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
