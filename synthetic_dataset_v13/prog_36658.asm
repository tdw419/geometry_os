; DESCRIPTION: Draws a yellow line from (34, 174) to (433, 29).
; PLAN: r0=34(x1), r1=174(y1), r2=433(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 174
LDI r2, 433
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
