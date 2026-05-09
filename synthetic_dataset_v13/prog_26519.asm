; DESCRIPTION: Draws a yellow line from (45, 96) to (12, 60).
; PLAN: r0=45(x1), r1=96(y1), r2=12(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 96
LDI r2, 12
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
