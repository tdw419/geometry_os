; DESCRIPTION: Draws a yellow line from (372, 68) to (368, 70).
; PLAN: r0=372(x1), r1=68(y1), r2=368(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 68
LDI r2, 368
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
