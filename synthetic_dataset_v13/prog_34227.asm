; DESCRIPTION: Draws a yellow line from (300, 51) to (174, 231).
; PLAN: r0=300(x1), r1=51(y1), r2=174(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 51
LDI r2, 174
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
