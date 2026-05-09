; DESCRIPTION: Draws a yellow line from (95, 3) to (174, 161).
; PLAN: r0=95(x1), r1=3(y1), r2=174(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 3
LDI r2, 174
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
