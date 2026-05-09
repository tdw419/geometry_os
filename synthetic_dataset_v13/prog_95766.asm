; DESCRIPTION: Draws a yellow line from (465, 173) to (100, 173).
; PLAN: r0=465(x1), r1=173(y1), r2=100(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 173
LDI r2, 100
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
