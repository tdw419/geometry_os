; DESCRIPTION: Draws a yellow line from (94, 10) to (165, 174).
; PLAN: r0=94(x1), r1=10(y1), r2=165(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 10
LDI r2, 165
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
