; DESCRIPTION: Draws a yellow line from (21, 220) to (80, 153).
; PLAN: r0=21(x1), r1=220(y1), r2=80(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 220
LDI r2, 80
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
