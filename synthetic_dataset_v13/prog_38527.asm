; DESCRIPTION: Draws a green line from (60, 100) to (340, 101).
; PLAN: r0=60(x1), r1=100(y1), r2=340(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 100
LDI r2, 340
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
