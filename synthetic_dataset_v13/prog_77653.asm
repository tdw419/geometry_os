; DESCRIPTION: Draws a yellow line from (54, 210) to (10, 174).
; PLAN: r0=54(x1), r1=210(y1), r2=10(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 210
LDI r2, 10
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
