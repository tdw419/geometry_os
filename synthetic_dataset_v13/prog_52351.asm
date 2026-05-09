; DESCRIPTION: Draws a yellow line from (70, 90) to (45, 144).
; PLAN: r0=70(x1), r1=90(y1), r2=45(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 90
LDI r2, 45
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
